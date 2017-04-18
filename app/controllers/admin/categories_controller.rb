class Admin::CategoriesController < Admin::BaseController
  layout "admin_layout"

  before_action :authenticate_user!
  before_action :load_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.order_date_desc.paginate page: params[:page],
      per_page: 10
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "create_complete"
    else
      flash[:danger] = "Category exist"
    end
    redirect_to :back
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = "Category updated"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "Delete complete"
    else
      flash[:danger] = "Not delete"
    end
    redirect_to :back
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:danger] = "Category not found"
      redirect_to :back
    end
  end
end
