class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :image

  validates :name, :description, :address, presence: true
  validates :price, numericality: { greater_than: 0 }

  def image_url
    if image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    else
      ActionController::Base.helpers.asset_path("default-room.png")
    end
  rescue
    ActionController::Base.helpers.asset_path("default-room.png")
  end
end
