class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    if params[:search].present?
      @rooms = Room.where("LOWER(address) LIKE ?", "%#{params[:search].downcase}%")
    else
      @rooms = logged_in? ? current_user.rooms : Room.all
    end
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @room, notice: "施設が登録されました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: "施設情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path, notice: "施設を削除しました。"
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :description, :price, :address, :image)
  end
end
