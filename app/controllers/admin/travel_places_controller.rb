class Admin::TravelPlacesController < Admin::BaseController
  layout "admin_layout"

  before_action :authenticate_user!
  before_action :load_travel_place, only: [:edit, :update, :destroy]

  def index
    @waiting = TravelPlace.waiting.order_updated_at.paginate page: params[:page],
      per_page: 10
    @approved = TravelPlace.approved.order_updated_at.paginate page: params[:page],
      per_page: 10
    @rejected = TravelPlace.rejected.order_updated_at.paginate page: params[:page],
      per_page: 10
    @travel_place = TravelPlace.new
    @cities = City.all
    @categories = Category.all
  end

  def create
    @travel_place = TravelPlace.new travel_place_params
    if @travel_place.save
      flash[:success] = "Create TravelPlace Complete"
    else
      flash[:danger] = "TravelPlace exist"
    end
    redirect_to :back
  end

  def edit
  end

  def update
    @travel_place.update status: params[:value]
    if @travel_place.save
      flash[:success] = "success"
    else
      flash[:danger] = "not success"
    end
    redirect_to :back
  end

  def destroy
    if @travel_place.destroy
      flash[:success] = "Delete Complete"
    else
      flash[:danger] = "Not delete"
    end
    redirect_to :back
  end

  private
  def travel_place_params
    params.require(:travel_place).permit :name, :address, :description, :cost, :avatar,
      :category_id, :city_id
  end

  def load_travel_place
    @travel_place = TravelPlace.find_by id: params[:id]
    unless @travel_place
      flash[:danger] = "Travel place not found"
      redirect_to :back
    end
  end
end
