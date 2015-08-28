class Message < ActiveRecord::Base
	validates :message, presence: true
end