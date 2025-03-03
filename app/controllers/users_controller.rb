class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit_account, :update_account, :edit_profile, :update_profile]
  before_action :require_login, only: [:edit_account, :update_account, :edit_profile, :update_profile]

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

  def edit_account
  end

  def update_account
    if @user.update(account_params)
      redirect_to user_path(@user), notice: "アカウント情報を更新しました。"
    else
      flash.now[:alert] = "アカウント情報の更新に失敗しました。"
      render :edit_account
    end
  end

  def edit_profile
  end

  def update_profile
    if @user.update(profile_params)
      redirect_to user_path(@user), notice: "プロフィールを更新しました。"
    else
      flash.now[:alert] = "プロフィールの更新に失敗しました。"
      render :edit_profile
    end
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

  def account_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def profile_params
    params.require(:user).permit(:icon, :name, :bio)
  end

  def set_user
    @user = current_user
  end

  def require_correct_user
    redirect_to root_path, alert: "権限がありません。" unless @user == current_user
  end
end
