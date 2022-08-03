class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(show create new)
  before_action :find_user, except: %i(index new create)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: %i(destroy)

  def new
    @user = User.new
  end

  def index
    @pagy, @users = pagy User.all, page: params[:page],
                                   items: Settings.pagy.page_size
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash.now[:success] = t ".signup_success"
      redirect_to @user
    else
      flash[:danger] = t ".signup_fail"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = t ".alert_update_user_success"
      redirect_to users_path
    else
      flash.now[:danger] = t ".alert_update_user_fail"
      render :edit
    end
  end

  def show; end

  def destroy
    if @user.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_fail"
    end

    redirect_to users_url
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t ".require_login"
    redirect_to login_path
  end

  def correct_user
    redirect_to root_url unless is_current_user? @user
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t ".user_not_found"
    redirect_to root_path
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
