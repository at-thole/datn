class Admin::BaseController < ApplicationController
  before_action :check_admin

  def check_admin
    unless current_user.admin?
      flash[:danger] = "You not admin"
      redirect_to root_url
    end
  end
end
