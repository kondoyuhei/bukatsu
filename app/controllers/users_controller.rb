class UsersController < ApplicationController
  before_action :set_new_user, only: [:login, :new]

  def login
  end

  def new
  end

  def create
  end

  def update
  end

  def logout
  end

  private

  def set_new_user
    @user = User.new
  end

end
