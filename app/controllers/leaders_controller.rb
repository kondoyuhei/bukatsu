class LeadersController < ApplicationController
  before_action :authenticate_user
  before_action :check_administrator

  def new
    @leader = LeaderDetail.new(user_id: params[:id])
  end

  def create
    leader = LeaderDetail.new(registration_params)
    if leader.save
      flash[:notice] = "教員（管理者）詳細を保存しました"
      redirect_to '/users/list'
    else
      flash[:notice] = "教員（管理者）を保存できませんでした"
      render 'leaders/new'
    end
  end

  def edit
    @leader = LeaderDetail.find_by(id: params[:id])
  end

  def update
    @leader = LeaderDetail.find_by(id: params[:id])
    @leader.position = registration_params[:grade]

    if @leader.save
      flash[:notice] = "教員（管理者）詳細を更新しました"
      redirect_to '/users/list'
    else
      flash[:notice] = "教員（管理者）詳細を更新できませんでした"
      render 'leaders/edit'
    end
  end

  def destroy
    @leader = LeaderDetail.find_by(id: params[:id])
    if @leader.destroy
      flash[:notice] = "教員（管理者）詳細を削除しました"
      redirect_to '/users/list'
    else
      flash[:notice] = "教員（管理者）詳細を削除できませんでした"
      redirect_to 'root_path'
    end
  end

  private

  def registration_params
    params.require(:leader_detail).permit(:user_id, :position)
  end

end
