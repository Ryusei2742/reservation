class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, :description, :address, presence: true
  validates :price, numericality: { greater_than: 0 }

  def image_url
    image.present? ? image.url : ActionController::Base.helpers.asset_path("deyadofault-image-4e0ac6b8d01335b5b22fe6586af13644ae51dddb6aeabf35b9174e80f13cd09d.png")
  end
end
