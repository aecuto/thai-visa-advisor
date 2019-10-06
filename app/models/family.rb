class Family < ApplicationRecord
  extend FriendlyId
  friendly_id :name

  has_many :members 
end
