class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  before_action :check_post_permission, only: [:new, :edit, :create, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :DESC)
  end

  def show
    @post = Post.find_by(post_id: params[:id])
  end

  def new
    @post = Post.find_by(post_id: params[:id])
  end

  private

  def authenticate_user
    unless @authenticate_user
      redirect_to root_path
    end
  end

  def check_post_permission
    if @current_user.admin != 0
      flash[:notice] = "投稿の作成・編集・削除はできません。"
      redirect_to root
    end
  end
end
