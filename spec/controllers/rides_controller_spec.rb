require 'rails_helper'

RSpec.describe RidesController, type: :controller do
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(create :user)
  end

  context 'GET #index' do
    it 'returns a rides for the logged in user' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'returns request rides' do
      get :index, params: {:format => 'request'}
      expect(response).to have_http_status(200)
    end

    it 'returns offer rides' do
      get :index, params: {:format => 'offer'}
      expect(response).to have_http_status(200)
    end
  end
end