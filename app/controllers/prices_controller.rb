class PricesController < ApplicationController

  # GET /prices
  def index
    params = price_params
    @dated_prices = Price.all.select{ |price| price[:date] == params[:date]}
    render json: @dated_prices.sort_by{|price|price[:time]}
  end

  def biggest
    params = price_params
    dated_prices = Price.all.select{ |price| price[:date] == params[:date]}
    valid_pairs = dated_prices.combination(2).to_a.select { |pair| pair[0][:time] < pair[1][:time] && pair[0][:value] > pair[1][:value] }
    best_pair = valid_pairs.max_by { |pair| pair[0][:value] - pair[1][:value] }
    profit = best_pair[0][:value] - best_pair[1][:value]
    render json: "%d€" %[profit * 100]
  end

  private
  def price_params
    params.require(:date)
    params[:date] = params[:date].to_date
    params
  end
end
