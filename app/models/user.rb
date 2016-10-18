class User < ActiveRecord::Base
	has_secure_password
	has_many :memberships
	has_many :orgs, through: :memberships
	validates :email, presence: true, uniqueness: true, length: {in:5..50}

	validates :first_name, :last_name, :password, :password_confirmation, presence: true, length: { in: 3..20 }

end
