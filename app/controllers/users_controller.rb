class UsersController < ApplicationController
  # before_action :authenticate_user,   except: [:login_page, :login, :logout]
  before_action :authenticate_user,   except: [:login_page, :login]
  before_action :check_administrator, only:   [:new, :edit, :update, :destroy]
  before_action :set_new_user,        only:   [:login_page, :new]

  def index
    @users = User.all
  end

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
    @user = User.new(registration_params)
    if @user.save && @user.admin == 11
      flash[:notice] = "ユーザー（教員）を登録しました"
      redirect_to '/users/list'
    elsif @user.save && @user.admin == 1
      flash[:notice] = "ユーザー（生徒）を登録しました"
      redirect_to "/students/#{@user.id}/new"
    elsif @user.save
      flash[:notice] = "ユーザーを登録しました"
      redirect_to root_path
    else
      flash[:notice] = "登録できませんでした"
      render '/users/new'
    end
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
    @leaders = User.where(admin: 11)
    @students = User.where(admin: 1)
    @parents = User.where(admin: 2)
  end

  private

  def set_new_user
    @user = User.new
  end

  def login_params
    params.require(:user).permit(:name, :password)
  end

  def registration_params
    params.require(:user).permit(:name, :password, :email, :phone, :admin)
  end


end
