class TravelPlacesController < ApplicationController
  def show
    @travel_place = TravelPlace.find_by id: params[:id]
    @value_rate = Rate.of_travel_place(params[:id])
      .find_by user_id: current_user.id if user_signed_in?
    @rate = Rate.new
    # @avg_rating = @travel_place.avg_rate
    @comments = @travel_place.comments
    @comment = Comment.new
  end

  def new
    @travel = TravelPlace.new
    @categories = Category.all
    @cities = City.all
  end

  def create
    @travel = TravelPlace.create get_travel_place
    if @travel
      flash[:success] = "Create Travel Place Complete"
      redirect_to root_path
    end
  end

  def get_travel_place
    params.require(:travel_place).permit :name, :address, :description, :cost, :avatar,
      :category_id, :city_id
  end
end
