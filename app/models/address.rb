class Address < ApplicationRecord
  belongs_to :hauliers
  belongs_to :shippers
end
