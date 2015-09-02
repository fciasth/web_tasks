class UserData < ActiveRecord::Base
	validates :name, :password, presence: true
	validates :name, uniqueness: true               #验证对象是否唯一
	validates :name, length:{in: 2..10}
	validates :password ,length:{in: 6..20}
end