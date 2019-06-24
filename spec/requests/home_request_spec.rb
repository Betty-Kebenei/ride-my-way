require 'rails_helper'

RSpec.describe 'Home requests', type: :request do
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(create :user)
  end

  it 'displays the home page' do
    get '/'
    expect(response).to render_template(:index)
  end
end