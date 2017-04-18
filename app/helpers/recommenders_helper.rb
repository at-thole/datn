module RecommendersHelper
  @@users = User.all
  @@travels = TravelPlace.all

  def matrix_d_train
    m_train=[]
    @@users.each do |user|
      array_u=[]
      @@travels.each do |travel|
        array_u << (rand(2..10).to_f / 2)
      end
      m_train << array_u
    end
    return m_train
  end

  def matrix_d_test
    @rates = Rate.all
    m_test=[]
    @@users.each do |user|
      array_u=[]
      @@travels.each do |travel|
        array_u << nil
        @rates.each do |rate|
          if user.id == rate.user_id && travel.id == rate.travel_place_id
            array_u.pop
            array_u << rate.num_rate
            break
          end
        end
      end
      m_test << array_u
    end
    return m_test
  end

  def matrix_user
    matrix_w = []
    @@users.each do
      array_u = []
      (1..2).each do
        array_u << (rand(0..3))
      end
      matrix_w << array_u
    end
    return matrix_w
  end

  def matrix_item
    matrix_h = []
    (1..2).each do
      array_i = []
      @@travels.each do
        array_i << (rand(0..3))
      end
      matrix_h << array_i
    end
    return matrix_h
  end

  def all_data
    @matrix_user = matrix_user
    @matrix_item = matrix_item
    @matrix_train = matrix_d_train
    @matrix_test = matrix_d_test
    @frobenius_w = get_frobenius @matrix_user
    @frobenius_h = get_frobenius @matrix_item
    @lamda = 0.01
    @beta = 0.0005
  end

  def r_ui_test u, i
    r_ui = 0
    (0..1).each do |k|
      r_ui += @matrix_user[u][k] * @matrix_item[k][i]
    end
    return r_ui
  end

  def get_frobenius matrix
    sum = matrix.map{|a| a.map {|x| x**2}.sum}.sum
    return sum
  end

  def sum_train matrix_train
    matrix_train.map{|u|
     u.map{|i|
      (i - (r_ui_test matrix_train.index(u), u.index(i)))**2
      }.sum
    }.sum
  end

  def w_new matrix_user, matrix_train
    matrix_user.each_with_index do |u, index_u|
      u.each_with_index do |k, index_k|
        matrix_user[index_u][index_k] = (k + @beta*(2*(matrix_train[index_u][0] -
        (r_ui_test index_u, 0)) * matrix_item[index_k][0] - @lamda * k)).round(2)
      end
    end
    return matrix_user
  end

  def h_new matrix_item, matrix_train
    matrix_item.each_with_index do |k, index_k|
      k.each_with_index do |i, index_i|
        matrix_item[index_k][index_i] = (i + @beta*(2*(matrix_train[0][index_i] -
        (r_ui_test 0, index_i)) * matrix_user[0][index_k] - @lamda * i)).round(2)
      end
    end
    return matrix_item
  end

  def update_matrix
    @matrix_test.each_with_index do |item, index_x|
      item.each_with_index do |value, index_y|
        if value.nil?
          if (r_ui_test index_x, index_y).round(2) < 1
            @matrix_test[index_x][index_y] = 1
          elsif (r_ui_test index_x, index_y).round(2) > 5
            @matrix_test[index_x][index_y] = 5
          else
            @matrix_test[index_x][index_y] = (r_ui_test index_x, index_y).round(2)
          end
        end
      end
    end
  end

  def avg_rate
    @@travels.each_with_index do |item, index_travel|
      dtb = 0
      @@users.each_with_index do |value, index_user|
        dtb += @matrix_test[index_user][index_travel]
      end
      item.update avg_rate: (dtb / @@users.size).round(2)
    end
  end
end
