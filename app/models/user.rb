class User < ApplicationRecord
  geocoded_by :current_sign_in_ip
  after_validation :geocode, if: :current_sign_in_ip_changed?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_and_belongs_to_many :guardings
  belongs_to :admin_user, optional: true

  def within_one_km_of_guarding?(guarding)
    user_coordinates = [self.latitude, self.longitude]
    guarding_coordinates = [guarding.latitude, guarding.longitude]

    distance = Geocoder::Calculations.distance_between(user_coordinates, guarding_coordinates)

    distance * 1000 <= 1000 # Check if the distance is less than or equal to 1 km
  end

  def name
    email
  end
end
