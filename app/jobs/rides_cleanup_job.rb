class RidesCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Ride.where("DATE(take_off) < ?", Date.today).destroy_all
  end
end
