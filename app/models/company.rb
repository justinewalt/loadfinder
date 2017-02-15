class Company < ApplicationRecord
  has_many :users
  belongs_to :user
  has_many :addresses, :as => :addressable
end
