class Admin::CitiesController < Admin::BaseController
  layout "admin_layout"

  before_action :authenticate_user!
  before_action :load_city, only: [:edit, :update, :destroy]

  def index
    @cities = City.order_date_desc.paginate page: params[:page],
      per_page: 10
    @city = City.new
  end

  def create
    @city = City.new city_params
    if @city.save
      flash[:success] = "Create City Complete"
    else
      flash[:danger] = "City exist"
    end
    redirect_to :back
  end

  def edit
  end

  def update
    if @city.update_attributes city_params
      flash[:success] = "City updated"
      redirect_to admin_cities_path
    else
      render :edit
    end
  end

  def destroy
    if @city.destroy
      flash[:success] = "Delete Complete"
    else
      flash[:danger] = "Not delete"
    end
    redirect_to :back
  end

  private
  def city_params
    params.require(:city).permit :name
  end

  def load_city
    @city = City.find_by id: params[:id]
    unless @city
      flash[:danger] = "City not found"
      redirect_to :back
    end
  end
end
