require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context '#create with email error' do
    before do
      request.env['omniauth.auth'] =
          OmniAuth.config.mock_auth[:google] =
              OmniAuth::AuthHash.new({
                                         :provider => 'google',
                                         :info => {
                                             :name => 'betty',
                                             :email => 'bet@betty.com'
                                         }
                                     })
    end
    it 'should raise an error is logged in with non-andelan email' do
      user = post :create
      error = user.request.flash_hash.instance_variable_get(:@flashes)
      expect(error).to include('error' => 'Kindly login with your Andela Email')
    end
  end

  context '#create and logout successfully' do
    before do
      request.env['omniauth.auth'] =
          OmniAuth.config.mock_auth[:google] =
              OmniAuth::AuthHash.new({
                                         :provider => 'google',
                                         :info => {
                                             :name => 'betty',
                                             :email => 'bet@andela.com'
                                         }
                                     })
    end
    it 'should create succesfully with andelan email' do
      user = post :create
      notice = user.request.flash_hash.instance_variable_get(:@flashes)
      expect(notice).to include('notice' => 'You have successfully logged in')
    end

    it 'should logout existing user' do
      post :create
      response = get :destroy
      notice = response.request.flash_hash.instance_variable_get(:@flashes)
      expect(notice).to include('notice' => 'You have successfully logged out')
    end
  end

end
