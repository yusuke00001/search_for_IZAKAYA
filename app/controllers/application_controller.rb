class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :require_sign_in
  before_action :set_current_user
  helper_method :signed_in?

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:user_remember_token] = remember_token
    user.update!(remember_token: User.encrypt(remember_token))
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:user_remember_token)
    binding.pry
  end

  def signed_in?
    @current_user.present?
  end

  def set_current_user
    remember_token = User.encrypt(cookies[:user_remember_token])
    @current_user = User.find_by(remember_token: remember_token)
  end

  def require_sign_in
    redirect_to login_path unless signed_in?
    flash[:alert] = "ログインしてください"
  end
end
