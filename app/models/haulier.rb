class Haulier < ApplicationRecord
  belongs_to :users
  has_many :jobs
  has_many :addresses
end
