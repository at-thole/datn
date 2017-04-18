class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  mount_uploader :avatar, PictureUploader
  enum role: [:user, :admin]
  def is_user? user
    self == user
  end
end
