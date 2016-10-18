class Org < ActiveRecord::Base
  #belongs_to :user
  has_many :memberships
  has_many :users, through: :memberships
  validates :name, :description, presence: true, length: {in:5..50}
  validates :description, presence: true, length: {in:10..250}
end
