# ************************************************************
#   studentsコントローラー（生徒詳細管理）
# ************************************************************

class StudentsController < ApplicationController
  before_action :authenticate_user
  before_action :check_administrator
  before_action :confirm_student, only: :new
  before_action :set_user, only: [:set, :edit, :show]

  def set
    @student = StudentDetail.new(user_id: @user.id)
  end

  def add
    @student = StudentDetail.new(registration_params)
    @user = User.find_by(id: registration_params[:user_id])
    if @student.save
      flash[:notice] = "#{@user.name} さんの生徒詳細を保存しました"
      redirect_to '/users/list'
    else
      flash[:notice] = "生徒詳細を保存できませんでした"
      render 'students/new'
    end
  end

  def edit
    if StudentDetail.where(user_id: params[:id]).empty?
      flash[:notice] = "ユーザー詳細情報がありません"
      redirect_to 'users/list'
    end
    @student = StudentDetail.find_by(user_id: params[:id])
    @parents = User.where(admin: 2)
  end

  def update
    @student = StudentDetail.find_by(user_id: params[:id])
    @student.grade = registration_params[:grade]
    @student.classroom = registration_params[:classroom]
    @student.parent1 = registration_params[:parent1]
    @student.parent2 = registration_params[:parent2]
    if @student.save
      flash[:notice] = "生徒詳細を更新しました"
      redirect_to '/users/list'
    else
      flash[:notice] = "生徒詳細を更新できませんでした"
      render 'students/edit'
    end
  end

  def destroy
    @student = StudentDetail.find_by(id: params[:id])
    if @student.destroy
      flash[:notice] = "生徒詳細を削除しました"
      redirect_to '/users/list'
    else
      flash[:notice] = "生徒詳細を削除できませんでした"
      redirect_to 'root_path'
    end
  end

  def show
  end

  private

  def registration_params
    params.require(:student_detail).permit(:grade, :classroom, :parent1, :parent2).merge(user_id: params[:id])
  end

  def confirm_student
    user = User.find_by(id: params[:id])
    if user.admin != 1
      flash[:notice] = "指定したユーザーは生徒でないため操作できません。"
      redirect_to '/users/list'
    end
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
