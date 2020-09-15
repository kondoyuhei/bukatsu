class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index]

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
end
