class Family < ApplicationRecord
  extend FriendlyId
  friendly_id :name

  has_many :members 

  belongs_to :user, :dependent => :destroy, optional: true
end
