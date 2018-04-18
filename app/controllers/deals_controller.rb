class DealsController < ApplicationController
  before_action :authenticate_user!

  def create
    @deal = Deal.new deal_params
    @deal.closing_date_probability = default_time

    if @deal.save
      flash[:success] = 'Your deal was successfully sent!'
    else
      flash[:alert] = 'You need to fill all fields!'
    end

    redirect_to root_path
  end

  def destroy
    deal = Deal.find_by(id: params[:id])
    flash[:success] = 'Your deal successfully destroyed!' if deal.destroy

    redirect_to root_path
  end

  def edit
    @deal = Deal.find_by(id: params[:id])
  end

  def index
    @deal = Deal.new
    @last_deal = Deal.last
    @deals = Deal.all
  end

  def update
    deal = Deal.find_by(id: params[:id])

    if deal.update(deal_params)
      flash[:success] = 'Your deal successfully updated!'
      redirect_to root_path
    else
      @deal = deal
      flash[:alert] = 'You need to fill all fields!'

      render :edit
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:customer, :description, :value, :status,
                                 :closing_date_probability)
  end

  def default_time
    (Time.zone.today + 30.days).strftime('%d/%m/%Y')
  end
end
