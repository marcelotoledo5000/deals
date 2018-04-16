class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @deal = Deal.new
  end
end
