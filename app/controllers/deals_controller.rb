class DealsController < ApplicationController
  before_action :authenticate_user!

  def create
    @deal = Deal.new deal_params
    @deal.closing_date_probability = default_time
    @deal.user_id = current_user.id

    if @deal.save
      flash[:success] = 'Your deal was successfully sent!'
    else
      flash[:warning] = 'You need to fill all fields!'
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
    @deals = Deal.where('user_id = ?', current_user)
  end

  def search
    search = params[:q].downcase
    deals = Deal.where('lower(customer) LIKE ? OR lower(description) LIKE ?',
                       '%' + search + '%', '%' + search + '%')

    if deals.empty?
      flash[:warning] = 'Deal not found'

      redirect_to root_path
    else
      @deals = deals
    end
  end

  def update
    deal = Deal.find_by(id: params[:id])

    if deal.update(deal_params)
      flash[:success] = 'Your deal successfully updated!'
      redirect_to root_path
    else
      @deal = deal
      flash[:warning] = 'You need to fill all fields!'

      render :edit
    end
  end

  def won
    deal = Deal.find_by(id: params[:deal_id])
    deal.won!
    flash[:success] = 'Your deal was Won!'

    redirect_to root_path
  end

  def lost
    deal = Deal.find_by(id: params[:deal_id])
    deal.lost!
    flash[:success] = 'Your deal was Lost!'

    redirect_to root_path
  end

  private

  def deal_params
    params.require(:deal).permit(:customer, :description, :value, :status,
                                 :closing_date_probability, :user_id)
  end

  def default_time
    (Time.zone.today + 30.days).strftime('%d/%m/%Y')
  end
end
