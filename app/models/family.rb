class Family < ApplicationRecord
  extend FriendlyId
  friendly_id :name

  has_many :members 

  belongs_to :organization

  belongs_to :user, :dependent => :destroy
  accepts_nested_attributes_for :user
  validates_associated :user
end
