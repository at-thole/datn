class StaticPagesController < ApplicationController
  def index
    @categories = Category.all
    @cities = City.all
    @q = TravelPlace.search params[:q]
    @travel_places = @q.result.approved
    unless params[:q].blank?
      respond_to do |format|
        format.js
      end
    end
  end
end
