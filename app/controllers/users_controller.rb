class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @wikis = @user.wikis

    @stripe_btn_data = {
      key: "#{ENV['STRIPE_PUBLISHABLE_KEY']}",
      description: "Upgrade to Premium",
      amount: Amount.default
    }
  end
end