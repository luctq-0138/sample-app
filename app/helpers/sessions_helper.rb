module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def handle_login user
    if user.activated?
      log_in user
      if params[:session][:remember_me] == Settings.true
        remember(user)
      else
        forget(user)
      end
      redirect_back_or user
    else
      flash[:warning] = t ".account_not_activated"
      redirect_to root_url
    end
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget user
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user&.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def is_current_user? user
    user && user == current_user
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    forget current_user
    session.delete(:user_id)
    @current_user = nil
  end

  def redirect_back_or default
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
