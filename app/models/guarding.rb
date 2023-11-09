class Guarding < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :admin_user, optional: true
  has_and_belongs_to_many :users
end
