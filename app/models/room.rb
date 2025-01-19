class Room < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :check_in, :check_out, presence: true
  validate :check_in_after_today, :check_out_after_check_in
  validates :guests, numericality: { greater_than: 0 }
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, :description, :address, presence: true
  validates :price, numericality: { greater_than: 0 }

  private

  def check_in_after_today
    errors.add(:check_in, "は本日以降の日付を指定してください") if check_in < Date.today
  end

  def check_out_after_check_in
    errors.add(:check_out, "はチェックイン日より後の日付を指定してください") if check_out <= check_in
  end
end
