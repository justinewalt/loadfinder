class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :email
  attr_accessor :terms_accepted
  # attr_accessor :haulier_or_shipper
  # before_validation :assign_roles

    # def assign_roles
    #   self.shipper = (haulier_or_shipper == "shipper")
    #   self.haulier = (haulier_or_shipper == "haulier")
    # end
end
