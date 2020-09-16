class ApplicationController < ActionController::Base
  before_action :set_current_user

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインしてください"
      redirect_to '/login'
    end
  end

  def check_administrator
    if @current_user && @current_user.administrator == false
      flash[:notice] = "管理者としてログインしてください"
      redirect_to root_path
    end
  end

  private

  def set_current_user
    if session[:user_id] != nil
      @current_user = User.find_by(id: session[:user_id])
    end
  end
  
end
