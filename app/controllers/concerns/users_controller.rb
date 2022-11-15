class UsersController < ApplicationController

  def new
    @user = Use.new
    @user.save
  end

  def create
    @user = User.create(user_params)
    @user.save
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).parmit(:last_name,:first_name,:last_name_kana,:first_name_kana,:nickname,:email,:encrypted_password,:birthday)
  end
end
