class Category < ApplicationRecord
  has_many :travel_places
  validates :name, presence: true, uniqueness: {case_sentitive: true}
  scope :order_date_desc, -> {order created_at: :desc}
end
