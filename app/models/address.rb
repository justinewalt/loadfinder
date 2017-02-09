class Address < ApplicationRecord
  belongs_to :hauliers
  belongs_to :shippers
  belongs_to :jobs
end
