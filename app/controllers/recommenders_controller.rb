class RecommendersController < ApplicationController
  include RecommendersHelper

  def index
    all_data
    omf = sum_train(@matrix_train) + @lamda*(@frobenius_w + @frobenius_h)
    condition = omf*0.75
    a = 0
    while omf > condition do
      @matrix_user = w_new @matrix_user, @matrix_train
      @matrix_item = h_new @matrix_item, @matrix_train
      omf = sum_train(@matrix_train) +
        @lamda*(get_frobenius(@matrix_user) + get_frobenius(@matrix_item))
        a+=1
    end
    update_matrix
    avg_rate
    redirect_to root_path
  end
end
