class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :bids

  validates_presence_of :terms_accepted

  # before_validation :assign_roles

end
