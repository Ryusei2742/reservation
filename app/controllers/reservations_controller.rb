class ReservationsController < ApplicationController
  before_action :set_room, only: [:new, :create]
  before_action :set_reservation, only: [:show]

  def index
    @reservations = current_user.reservations.includes(:room)
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.room = @room
    if @reservation.save
      redirect_to @reservation, notice: "予約が完了しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :guests)
  end
end
