class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "登録完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "更新完了しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon, :bio)
  end

  def set_user
    @user = current_user
  end

  def require_correct_user
    redirect_to root_path, alert: "権限がありません。" unless @user == current_user
  end
end
