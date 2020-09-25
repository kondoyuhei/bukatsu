# ************************************************************
#   usersコントローラー（ユーザー管理）
# ************************************************************

class UsersController < ApplicationController
  # before_action :authenticate_user,   except: [:login_page, :login, :logout]
  require 'active_support'
  before_action :authenticate_user,   except: [:login_page, :login, :first_user, :first_user_registration]
  before_action :check_administrator, only:   [:new, :edit, :update, :destroy, :list]
  before_action :set_new_user,        only:   [:login_page, :new]
  before_action :prohibit_first_user_registration, only: [:first_user, :first_user_registration]


  # ****************************************
  #   ユーザー登録・編集
  # ****************************************
  def index
    @users = User.all
  end

  # ****************************************
  #   ログイン・ログアウト
  # ****************************************
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

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end


  # ****************************************
  #   ユーザー作成
  # ****************************************
  def new
  end

  def create
    @user = User.new(registration_params)
    if @user.save && @user.admin == 11
      flash[:notice] = "ユーザー #{@user.name} さん（指導者）を登録しました"
      redirect_to users_list_path
    elsif @user.save && @user.admin == 1
      flash[:notice] = "ユーザー #{@user.name}さん （生徒）を登録しました"
      redirect_to set_student_path(@user)
    elsif @user.save && @user.admin == 2
      flash[:notice] = "ユーザー #{@user.name}さん （保護者）を登録しました"
      redirect_to users_list_path
    elsif @user.save
      flash[:notice] = "ユーザーを登録しました"
      redirect_to root_path
    else
      flash[:notice] = "登録できませんでした"
      render '/users/new'
    end
  end

  # ****************************************
  #   ユーザー編集
  # ****************************************
  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])

    @user.name = registration_params[:name]
    @user.email = registration_params[:email]
    @user.password = registration_params[:password] if registration_params[:password] != ""
    @user.phone = registration_params[:phone]

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to '/users/list'
    else
      flash[:notice] = "ユーザー情報を編集できませんでした"
      render 'users/edit'
    end
  end

  # ****************************************
  #   ユーザー削除
  # ****************************************
  def destroy
    @user = User.find_by(id: params[:id])

    if @user.administrator && User.where(admin: 11).length == 1
      flash[:notice] = "管理者がいなくなるためユーザー削除できません"
      redirect_to '/users/list' and return
    end

    if @user.destroy
      flash[:notice] = "ユーザーを削除しました"
    else
      flash[:notice] = "ユーザーを削除できませんでした"
    end
    redirect_to '/users/list'
  end

  # ****************************************
  #   初期ユーザー登録
  # ****************************************
  def first_user
  # 初期ユーザー登録ページの表示
    @user = User.new
  end

  def first_user_registration
  # 初期ユーザー登録
    @user = User.new(registration_params.except(:admin))
    @user.admin = 11
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "初期ユーザー登録をしました id: #{@user.id} name: #{@user.name}"
      redirect_to '/users/list'
    else
      flash[:notice] = "初期ユーザー登録をできませんでした"
      render 'users/first_user'
    end
  end

  # ****************************************
  #   ユーザー管理画面
  # ****************************************
  def list
    @leaders = User.where(admin: 11)
    if StudentDetail.all.length >= 1
      @students = User.where(admin: 1).includes(:student_detail)
    else
      @students = User.where(admin: 1)
    end
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

  # ****************************************
  #   初期ユーザー登録
  # ****************************************
  def prohibit_first_user_registration
  # 管理者が1人でもいる場合は初期ユーザー登録をさせない処理
    if User.where(admin: 11).exists?
      flash[:notice] = "すでに管理者がいるためこの操作はできません。"
      redirect_to root_path and return
    end
  end
end
