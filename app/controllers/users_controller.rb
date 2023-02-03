class UsersController < ApplicationController
  before_action :protect_pages_super_admin
  before_action :set_user, only: %i[ edit update destroy ]

  def index
    @users = User.order(created_at: :desc).load_async
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if set_user.update(user_params)
      # set_user.broadcast
      redirect_to users_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_user.destroy
    redirect_to users_url, notice: t('.destroyed'), status: :see_other
  end

  private
    def set_user
      @user ||= User.find(params[:id])
    end

    def user_params
      # params.fetch(:user, {})
      params.require(:user).permit(:email, :username, :password, :super_admin, :admin)
    end

    def protect_pages_super_admin
      redirect_to root_path, alert: t('common.not_authorized') unless Current.user&.super_admin?
    end
end
