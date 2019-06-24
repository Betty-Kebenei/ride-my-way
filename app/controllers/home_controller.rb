class HomeController < ApplicationController
  skip_before_action :require_logout

  def index
  end
end
