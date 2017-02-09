class Job < ApplicationRecord
  belongs_to :users
  has_many :bids
  has_one :address

  def self.search(search)
    where("pickup_location ILIKE ? OR dropoff_location ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
