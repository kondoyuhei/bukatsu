class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  before_action :check_administrator, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.includes(:comment).order(created_at: :DESC)
  end

  def show
    @comments = @post.comments
  end

  # ****************************************
  #   投稿の新規作成
  # ****************************************
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'お知らせを投稿しました'
      redirect_to root_path
    else
      flash[:notice] = '投稿できませんでした'
      render '/posts/index'
    end
  end

  # ****************************************
  #   投稿の編集
  # ****************************************
  def edit
  end

  def update
    @post.title = post_params[:title]
    @post.content = post_params[:content]
    if @post.save
      flash[:notice] = 'お知らせを投稿しました'
      redirect_to root_path
    else
      flash[:notice] = '投稿できませんでした'
      render '/posts/index'
    end
  end

  # ****************************************
  #   投稿管理画面
  # ****************************************
  def list
    @posts = Post.all.order(created_at: :DESC)
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: @current_user.id)
  end
end
