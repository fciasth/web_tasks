# encoding: utf-8

require 'mysql2'
require 'sinatra'
Dir.chdir(File.dirname(__FILE__))
require 'active_record'
require 'erb'
require './lib/userData.rb'
require './lib/message.rb'

use Rack::Session::Pool, :expire_after => 120 #session的过期时间为120秒，登录成功后120秒内无操作，session失效

#connection

ActiveRecord::Base.establish_connection(
	:adapter => "mysql2",
	:host => "127.0.0.1",
	:username => "fciasth",
	:password => "2015@",
	:database => "root"
	)

configure do
	enable :sessions
end

#routes
get '/' do
	@message_vector =[]
	type = params['select']
	value = params['value']
	if type.nil?||type.empty?||value.nil?||value.empty?
		@message_vector = Message.all.order(created_at: :DESC)
	elsif type == 'id'
		m = Message.find(value)
		if not m.nil?
			@message_vector<<m
		else
			@error = "没有此id的留言"
		end
	elsif type == 'author'
		userData.all.each do |user|
			if user.name.include?(value)
				Message.where(user_id: user.id).order(created_at: :DESC).each do |m|
					@message_vector<<m
				end
			end
		end
		if not @message_vector.nil?
			@error = "没有此author的留言"
		end
	end
end

get '/login' do
	erb :login
end

post '/login' do
	name = params['name']
	password = params['password']
	userData = UserData.find_by(name: name,password: password)
	@error = []
	if userData.nil?
		@error<<"用户名或密码错误 请重新登录"
		redirect to '/login'
	else
		session['username'] = name
		session['user_id'] = user.id
		redirect to '/'
	end
end

get '/register' do
	erb :register
end

post '/register' do
	name = params['username']
	password = params['password']
	rePassword = params['rePassword']
	@error = []
	if password == rePassword
		userData = UserData.new(name: name,password: password)
		if userData.valid?
			userData.save
			session['username'] = name
			session['user_id'] = userData.id
			redirect to '/'
		else
			userData.errors.mesages.each do |msg|
				@error <<msg
			end
		end
	else
		@error <<'两次密码不一致'
	end
	erb :error_report
end

post '/relogin' do
	if !session['name'].nil?
		session['name'] = nil
		session['use_id'] = nil
	end
	redirect to '/'
end

get '/add' do
	if session['username'].nil?
		redirect to '/login'
	end
	erb :add
end

post '/add' do
	@errors = []
	vector = params['mesages']
	if vector.empty?||vector.length <10
		@errors<<'留言不得少于十个字'
	else
		message_ = Message.new(user_id:session['user_id'],
			message:message,
			created_at:Time.now,
			created_at:Time.now)
		message_.save
		redirect to '/'
	end
	erb :add
end

post '/delete' do
	message_N = params['id']
	Message.delete(message_N)
	erb :delete
end

not_found do 
	404
end

error do
	return status
end