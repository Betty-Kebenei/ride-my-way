require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  context 'GET #index' do
    it 'returns the login page' do
      get :index
      expect(response).to be_success
    end
  end
end
