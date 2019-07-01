require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(create :user)
  end
  
  context 'GET #index' do
    it 'returns the home page' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
