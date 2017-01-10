class Job < ApplicationRecord
  belongs_to :users
  has_many :jobs
end
