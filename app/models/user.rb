class User < ActiveRecord::Base
	has_secure_password
	validates :email, uniqueness: true

	validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true, length: { in: 3..20 }

end
