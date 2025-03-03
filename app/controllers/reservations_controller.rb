class ReservationsController < ApplicationController
  before_action :set_room, only: [:new, :confirm, :create]
  before_action :set_reservation, only: [:show]
  before_action :require_login

  def index
    @reservations = current_user.reservations.includes(:room)
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.new(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to reservation_path(@reservation), notice: "予約が完了しました。"
    else
      flash[:alert] = "予約の確定に失敗しました。"
      render :confirm
    end
  end

  def confirm
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(reservation_params)

    if @reservation.check_in.present? && @reservation.check_out.present?
      @days = (@reservation.check_out - @reservation.check_in).to_i
    else
      @days = 0
    end

    if @days.positive? && @reservation.guests.present?
      @total_price = @room.price * @days * @reservation.guests
    else
      @total_price = 0
    end

    render :confirm
  end


  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :guests, :room_id)
  end
end
