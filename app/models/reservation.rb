class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, :check_out, :guests, presence: true
  validate :check_in_after_today, :check_out_after_check_in
  validates :guests, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }

  def total_price
    days = (check_out - check_in).to_i
    room.price * days * guests
  end

  private

  def check_in_after_today
    if check_in.nil?
      errors.add(:check_in, "は必須です。")
    elsif check_in < Date.today
      errors.add(:check_in, "は本日以降の日付を指定してください")
    end
  end

  def check_out_after_check_in
    if check_out.nil?
      errors.add(:check_out, "は必須です。")
    elsif check_out <= check_in
      errors.add(:check_out, "はチェックイン日より後の日付を指定してください")
    end
  end

end
