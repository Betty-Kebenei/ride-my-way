require 'rails_helper'

RSpec.describe 'Login requests', type: :request do
  it 'displays the login button' do
    get '/login'
    expect(response).to render_template(:index)
  end
end