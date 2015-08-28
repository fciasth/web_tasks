require 'sinatra'
require 'erb'
require 'json'

class Data
	@@count = 0
	attr_reader :author,  :message, :id, :created_at
	attr_writer :author,  :message, :id, :created_at
	def initialize#(author,message,created_at,count,id)
		@author = author
		@message = message
		@created_at = Time.new
		@@count +=1
		@id = @@count
	end
end

class Tool
	vector = Array.new 
	def add(message_)
			temp = Data.new
			return 'The autor are not allowed to be empty!'  if message_.author == nil ||message_.author ==' '
			return 'The message are not allowed to be empty!' if  message_.message ==nil||message_.message ==' '
			vector << message_ 
			message_.id
	end
	def edit(id_,message_)
		return 'The message are not allowed to be empty!'  if message_.message ==nil||message_.message ==' '
		vector.each do |i|
			if i.id == id_
				i.message = message_
				return true
			end
		end
		'The message is not exist'
	end
	def inquire(sort = ' ',query = {:default => ' '})
		vector2 = Array.new
		key = query.keys[0]
		case key
		    when :id
		         vector.each do |i|
			   if  i.id ==query[key].to_i
			   	 return i
			   else
			       'The id is not exist'
			   end
		    end
		    when :author
		         vector.each {|i| vector2 << i if i.author.include?query[key]}
		     else
		         vector2.concat(vector)
		end
		vector2.sort!{|a,b|a.id <=> b.id}
	end
	def delete(id)
		vector.each do |i|
			if i.id !=id
		   	  pre_delete_val = vector.length
		   	  vector2.delete_if{|i|i.id == id}
		   	  current_val == vector.length
		   	  (pre_delete_val>current_val) ? pre_delete_val - current_val : ' Not found this id'
			else
			  return "No found this id"
			end
		end
	end
end

tool = Tool.new

get '/' do
    key = params['key']
    val =params['val']
    if key != nil && val !=nil
    	@vector = tool.inquire('created_at',{key.to_sym => val})
    end
    erb :index
end
get '/delete/:id'do |id|
    @result = tool.delete(id.to_i)
    erb :delete
end

post '/add' do
	@message = tool.new(params['autor'],params['message'])
	@v = tool.add(@message)
	redirect('/') if @v.is_a?(Integer)
	erb :add
end

get '/add' do
	erb :add
end

post '/edit/:id' do |id|
	@message = params['message']
	if @message != nil && @message != ' '
		@v =tool.edit(id.to_i ,@message) 
	else
		redirect('/') 
	end
	erb :edit
end
not_found do 
	404
end