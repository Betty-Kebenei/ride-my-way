class Ride < ApplicationRecord
  belongs_to :user

  validates :ride_type, :origin, :destination, :take_off, :user_id,  presence: true

end
