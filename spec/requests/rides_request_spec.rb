require 'rails_helper'

RSpec.describe 'Rides requests', type: :request do
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(create :user)
  end

  context 'get rides' do
    it 'displays the 0 rides' do
      get '/'
      expect(response).to render_template(:index)
    end
  end

  context 'new ride' do
    it 'creates a ride and redirects to the show page' do

      get '/rides/new.offer'
      expect(response).to render_template(:new)

      post '/rides', :params => { :ride => {
          :ride_type => 'offer',
          :origin => 'ET',
          :destination => 'Amity',
          :take_off =>  '2019-06-18 11:07:00',
          :respondents => {},
          :number_of_people => 2}}

      expect(Ride.count).to equal(1)
      expect(response).to redirect_to(assigns(:ride))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include('Ride was successfully created.')
    end

    it 'does not create a ride if invalid details are submitted' do
      get '/rides/new.offer'
      expect(response).to render_template(:new)

      post '/rides', :params => { :ride => {
          :ride_type => '',
          :origin => 'ET',
          :destination => 'Amity',
          :take_off =>  '2019-06-18 11:07:00',
          :number_of_people => 2}}

      expect(response).to render_template(:new)
    end
  end

  # TODO
  # context 'delete ride' do
  #   before(:each) do
  #     post '/rides', :params => { :ride => {
  #         :ride_type => 'offer',
  #         :origin => 'ET',
  #         :destination => 'Amity',
  #         :take_off =>  '2019-06-18 11:07:00',
  #         :respondents => {},
  #         :number_of_people => 2}}
  #     ride_id = assigns(:ride).id
  #     delete `/rides/#{ride_id}`
  #   end
  #
  #   it 'successfully deletes a ride' do
  #     expect(Ride.count).to equal(0)
  #   end
  # end
end