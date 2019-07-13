class Family < ApplicationRecord
  has_many :members
  belongs_to :organization
  belongs_to :user

end
