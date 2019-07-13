class Organization < ApplicationRecord
  has_many :families
  
  belongs_to :user
  accepts_nested_attributes_for :user
  validates_associated :user

end
