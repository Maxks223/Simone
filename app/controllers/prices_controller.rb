class PricesController < ApplicationController

  # GET /prices
  def index
    params = price_params
    @dated_prices = Price.all.select{ |price| price[:date] == params[:date]}
    render json: @dated_prices.sort_by{|price|price[:time]}
  end


  private
  def price_params
    params.require(:date)
    params[:date] = params[:date].to_date
    params
  end
end
