class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one_attached :icon
  validates :bio, length: { maximum: 500 }, allow_blank: true

  include Rails.application.routes.url_helpers

  def icon_url
    if icon.attached?
      Rails.application.routes.url_helpers.rails_blob_url(icon, only_path: true)
    else
      ActionController::Base.helpers.asset_path("default-avatar.png")
    end
  end
end
