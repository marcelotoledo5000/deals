# frozen_string_literal: true

class DealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deal, only: %i[destroy edit lost update won]

  # TODO: add this messages to locale
  SUCCESS_MSG = 'Your deal was successfully sent!'
  WARNING_MSG = 'You need to fill all fields!'
  DESTROYED_MSG = 'Your deal successfully destroyed!'

  def create
    Deal.create(deal_params).then do |deal|
      deal.closing_date_probability = DealsService.set_default_time
      deal.user_id = current_user.id
      deal.save ? flash[:success] = SUCCESS_MSG : flash[:warning] = WARNING_MSG

      redirect_to root_path
    end
  end

  def destroy
    flash[:success] = DESTROYED_MSG if deal.destroy

    redirect_to root_path
  end

  def edit; end

  def index
    @deal = Deal.new

    Deal.where(user: current_user).then do |deals|
      @last_deal = deals.last

      if search_params.present?
        deals = deals.merge(search_deals)
        flash[:warning] = 'Deal not found' if deals.empty?
      end

      @deals = deals.order(created_at: :desc)
    end
  end

  def lost
    deal.lost!
    flash[:success] = 'Your deal was Lost!'

    redirect_to root_path
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
    params[:q]&.downcase
  end

  def set_deal
    @deal = Deal.find_by(id: params[:id]) || Deal.find_by(id: params[:deal_id])
  end

  def search_deals
    Deal.
      where('customer ILIKE ?', "%#{search_params}%").
      or(Deal.where('description ILIKE ?', "%#{search_params}%"))
  end
end
