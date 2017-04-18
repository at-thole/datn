class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :travel_place

  scope :of_travel_place, -> travel_place_id do
    where travel_place_id: travel_place_id
  end
end
