class Member < ApplicationRecord
  extend FriendlyId
  friendly_id :first_name

  belongs_to :family
end
