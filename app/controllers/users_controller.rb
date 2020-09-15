class UsersController < ApplicationController
  before_action :set_new_user, only: [:login, :new]

  def login_page
  end

  def login
    @user = User.find_by(name: login_params[:name])
    # binding.pry
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] == @user.id
      flash[:notice] = "ログインしました"
      redirect_to root_path
    else
      flash[:notice] = "正しく入力してください"
      render 'users/login_page'
    end
  end

  def new
  end

  def create
  end

  def update
  end

  def logout
  end

  private

  def set_new_user
    @user = User.new
  end

  def login_params
    params.permit(:name, :password, :authenticity_token, :commit)
  end

end
