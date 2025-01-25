class UserSessionsController < ApplicationController
  before_action :set_user, only: [ :create ]
  def new
  end

  def create
    if @user.authenticate(user_session_params[:password])
      sign_in(@user)
      flash[:notice] = "ログインに成功しました"
      redirect_to #
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new, status: :unprocessable_entity
    end
    binding.pry
  end

  private

  def user_session_params
    params.permit(:email, :password)
  end

  def set_user
    @user = User.find_by!(email: user_session_params[:email])
  rescue
    flash.now[:alert] = "登録されていないメールアドレスです"
    render :new, status: :unprocessable_entity
  end

  def destroy
    sign_out
    redirect_to login_path
  end
end
