require 'rails_helper'

RSpec.describe 'Home requests', type: :request do
  it 'displays the home page' do
    get '/'
    expect(response).to render_template(:index)
  end
end