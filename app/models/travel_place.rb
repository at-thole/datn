class TravelPlace < ApplicationRecord
  enum status: [:waiting, :approved, :rejected]
  belongs_to :category
  belongs_to :city
  has_many :comments

  scope :order_updated_at, -> {order updated_at: :desc}

  # def avg_rate
  #   rate = Rate.of_travel_place self.id
  #   total_rate = 0
  #   rate.each do |shop|
  #     total_rate  = shop.num_rate.to_f
  #   end
  #   total_rate/rate.size.to_i unless rate.size.to_i == 0
  # end
end
