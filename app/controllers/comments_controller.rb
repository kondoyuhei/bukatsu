class CommentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :confirm_commenter, except: [:index, :show]
  before_action :confirm_editor, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.where(post_id: @post.id)
  end

  def show
  end

  # ****************************************
  #   コメントの新規作成
  # ****************************************
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to post_path(@post)
    else
      flash[:notice] = 'コメントを投稿できませんでした'
      render '/post/show'
    end
  end

  # ****************************************
  #   コメントの編集
  # ****************************************
  def edit
  end

  def update
    @comment.comment = comment_params[:comment]
    if @comment.user != @current_user
      @comment.comment += '　（教員によって編集済み）'
    end
    if @comment.save
      flash[:notice] = 'コメントを編集しました'
      redirect_to post_path(@post)
    else
      flash[:notice] = 'コメントを編集できません'
      render '/comments/edit'
    end
  end

  # ****************************************
  #   コメントの削除
  # ****************************************
  def destroy
    if @comment.destroy
      flash[:notice] = 'コメントを削除しました'
    else
      flash[:notice] = 'コメントを削除できませんでした'
    end
    redirect_to post_path(@post)
  end

  private

  # ****************************************
  #   コメントの投稿権限があるか確認する
  # ****************************************
  def confirm_commenter
    unless @current_user.administrator || @current_user.student
      flash[:notice] = 'コメントの投稿ができるのは教員・生徒だけです'
      redirect_to root_path
    end
  end

  # ****************************************
  #   コメントの編集権限があるか確認する
  # ****************************************
  def confirm_editor
    unless @current_user.administrator || @current_user.id == Comment.find_by(id: params[:id]).user_id
      flash[:notice] = 'コメントの編集ができるのは教員かコメント投稿者本人だけです'
      redirect_to root_path
    end
  end

  # ****************************************
  #   コメントを取得する
  # ****************************************
  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  # ****************************************
  #   コメントが紐づく投稿を取得する
  # ****************************************
  def set_post
    @post = Post.find_by(id: params[:post_id])
  end

  # ****************************************
  #   コメントのストロングパラメーター設定
  # ****************************************
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: @current_user.id, post_id: params[:post_id])
  end
end
