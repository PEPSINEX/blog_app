class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_avtion :set_is_enabled_true, only: [:create, :update]

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, success: "#{User.model_name.human}を登録しました"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, success: "#{User.model_name.human}を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path, danger: "#{User.model_name.human}を削除しました"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
