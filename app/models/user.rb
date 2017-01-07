class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :terms_accepted

  # before_validation :assign_roles

    # def assign_roles
    #   self.shipper = (haulier_or_shipper == "shipper")
    #   self.haulier = (haulier_or_shipper == "haulier")
    # end
end
