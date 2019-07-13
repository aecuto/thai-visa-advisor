class Organization < ApplicationRecord
  has_many :families
  
  belongs_to :user, :dependent => :destroy
  accepts_nested_attributes_for :user
  validates_associated :user

end
