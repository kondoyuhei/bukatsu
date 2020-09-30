class CommentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_post
  before_action :confirm_commenter

  # ****************************************
  #   コメントの新規作成
  # ****************************************
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to post_path(@post)
    else
      flash[:notice] = "コメントを投稿できませんでした"
      render '/post/show'
    end
  end

  # ****************************************
  #   コメントの編集
  # ****************************************
  def update
    
  end

  # ****************************************
  #   コメントの削除
  # ****************************************
  def destroy

  end

  private

  # ****************************************
  #   ログインユーザーがコメントを投稿できるユーザーか確認する
  # ****************************************
  def confirm_commenter
    unless @current_user.administrator || @current_user.student
      flash[:notice] = "コメントの投稿はできません"
      redirect_to root_path
    end
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
    params.require(:comment).permit(:content).merge(user_id: @current_user.id, post_id: params[:post_id])
  end
end
