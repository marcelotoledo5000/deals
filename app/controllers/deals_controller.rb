class DealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deal, only: %i[destroy edit lost update won]

  def create
    deal = Deal.new deal_params
    deal.closing_date_probability = DealsService.set_default_time
    deal.user_id = current_user.id

    if deal.save
      flash[:success] = 'Your deal was successfully sent!'
    else
      flash[:warning] = 'You need to fill all fields!'
    end

    redirect_to root_path
  end

  def destroy
    flash[:success] = 'Your deal successfully destroyed!' if deal.destroy

    redirect_to root_path
  end

  def edit; end

  def index
    @deal = Deal.new
    @last_deal = Deal.last
    @deals = Deal.where('user_id = ?', current_user).order(created_at: :desc)
  end

  def lost
    deal.lost!
    flash[:success] = 'Your deal was Lost!'

    redirect_to root_path
  end

  def search
    deals = Deal.where('user_id = ?', current_user).where(
      'lower(customer) LIKE ? OR lower(description) LIKE ?',
      '%' + search_params + '%', '%' + search_params + '%'
    ).order(created_at: :desc)

    if deals.empty?
      flash[:warning] = 'Deal not found'

      redirect_to root_path
    else
      @deals = deals
    end
  end

  def update
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
    deal.won!
    flash[:success] = 'Your deal was Won!'

    redirect_to root_path
  end

  private

  attr_accessor :deal

  def deal_params
    params.require(:deal).permit(:customer, :description, :value, :status,
                                 :closing_date_probability, :user_id)
  end

  def search_params
    params[:q].downcase
  end

  def set_deal
    @deal = Deal.find_by(id: params[:id]) || Deal.find_by(id: params[:deal_id])
  end
end
