class UsersController < ApplicationController
  before_action :authenticate_user!

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end