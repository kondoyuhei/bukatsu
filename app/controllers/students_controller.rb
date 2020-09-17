class StudentsController < ApplicationController
  before_action :authenticate_user
  before_action :check_administrator
  before_action :confirm_student, only: :new

  def new
    @student = StudentDetail.new(user_id: params[:id])
    binding.pry
  end

  def create
    student = StudentDetail.new(registration_params)
    if student.save
      flash[:notice] = "生徒詳細を保存しました"
      redirect_to '/users/list'
    else
      flash[:notice] = "生徒詳細を保存できませんでした"
      render 'students/new'
    end
  end

  def edit
    @student = StudentDetail.find_by(id: params[:id])
  end

  def update
    @student = StudentDetail.find_by(id: params[:id])
    @student.grade = registration_params[:grade]
    @student.classroom = registration_params[:classroom]
    @student.parent = registration_params[:parent]
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

  private

  def registration_params
    params.require(:student_detail).permit(:user_id, :grade, :classroom, :parent)
  end

  def confirm_student
    user = User.find_by(id: params[:id])
    if user.admin != 1
      flash[:notice] = "指定したユーザーは生徒でないため生徒詳細を登録できません。"
      redirect_to '/users/list'
    end
  end
end
