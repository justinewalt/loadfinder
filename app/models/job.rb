class Job < ApplicationRecord
  belongs_to :users
  has_many :bids
end
