class Family < ApplicationRecord
  has_many :members
  
  belongs_to :organization
  accepts_nested_attributes_for :organization
  validates_associated :organization

  belongs_to :user, :dependent => :destroy
  accepts_nested_attributes_for :user
  validates_associated :user
end
