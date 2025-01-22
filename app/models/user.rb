class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one_attached :icon
  validates :bio, length: { maximum: 500 }, allow_blank: true

  def icon_url
    icon.present? ? icon.url : ActionController::Base.helpers.asset_path("deuserfault-avatar-7a6cbfd7993e89f24bfc888f4a035a83c6f1428b8bdc47eed9095f2799a40153.png")
  end
end
