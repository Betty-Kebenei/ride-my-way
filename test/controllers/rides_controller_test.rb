require 'test_helper'

class RidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ride = rides(:one)
  end

  test "should get index" do
    get rides_url
    assert_response :success
  end

  test "should get new" do
    get new_ride_url
    assert_response :success
  end

  # TODO
  # test "should create ride" do
  #   assert_difference('Ride.count') do
  #     post rides_url, params: {
  #         ride: {
  #             destination: @ride.destination,
  #             number_of_people: @ride.number_of_people,
  #             origin: @ride.origin,
  #             take_off: @ride.take_off,
  #             ride_type: @ride.ride_type,
  #             user_id: @ride.user_id
  #         }
  #     }
  #   end
  #
  #   assert_redirected_to ride_url(Ride.last)
  # end

  test "should show ride" do
    get ride_url(@ride)
    assert_response :success
  end

  test "should get edit" do
    get edit_ride_url(@ride)
    assert_response :success
  end

  test "should update ride" do
    patch ride_url(@ride), params: { ride: { destination: @ride.destination, number_of_people: @ride.number_of_people, origin: @ride.origin, take_off: @ride.take_off, ride_type: @ride.ride_type, user_id: @ride.user_id } }
    assert_redirected_to ride_url(@ride)
  end

  test "should destroy ride" do
    assert_difference('Ride.count', -1) do
      delete ride_url(@ride)
    end

    assert_redirected_to rides_url
  end
end
