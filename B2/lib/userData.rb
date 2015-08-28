class UserData < ActiveRecord::Base
	validate :name, :password, presence: true
	validate :name, uniqueness: true               #验证对象是否唯一
	validate :name, length:{in: 2..10}
	validate :password ,length:{in: 6..20}
end