class Shipper < ApplicationRecord
  belongs_to :users
  has_many :bids
  has_many :addresses, :as => :addressable
end
