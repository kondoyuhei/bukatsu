class UsersController < ApplicationController
  before_action :set_new_user, only: [:login_page, :new]
  before_action :check_administrator, only: [:edit, :update, :destroy]

  def login_page
  end

  def login
    @user = User.find_by(name: login_params[:name])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
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

  def edit
  end

  def update
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end

  def list
    @leaders = User.where(admin: 0)
    @students = User.where(admin: 1).includes(:student_details)
    @parents = User.where(admin: 2)
  end

  private

  def set_new_user
    @user = User.new
  end

  def login_params
    params.require(:user).permit(:name, :password)
  end

  def check_administrator
    return true if @current_user && @current_user.admin == 0

    false
  end

end
