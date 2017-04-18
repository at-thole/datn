class RatesController < ApplicationController
  def create
    @rate = current_user.rates.build rate_params
    unless @rate.save
      flash[:danger] = "Rate not create"
      redirect_to root_url
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def rate_params
    params.require(:rate).permit :num_rate, :travel_place_id
  end
end
