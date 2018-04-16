class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @deal = Deal.new
    @last_deal = Deal.last
    @deals = Deal.all
  end
end
