class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  before_action :check_administrator, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_post, only: [:show, :edit]

  def index
    @posts = Post.all.order(created_at: :DESC)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  private

  def authenticate_user
    unless @authenticate_user
      redirect_to root_path
    end
  end

  def check_administrator
    unless @current_user && @current_user.administrator
      flash[:notice] = "投稿の作成・編集・削除はできません。"
      redirect_to root
    end
  end

  def set_post
    @post = Post.find_by(post_id: params[:id])
  end
end
