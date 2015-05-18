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

  def edit
    @user = User.find(params[:id])
    @stripe_btn_data = {
      key: "#{ENV['STRIPE_PUBLISHABLE_KEY']}",
      description: "Upgrade to Premium",
      amount: Amount.default
    }
    render 'devise/registrations/edit', locals: {resource: @user, resource_name: 'user'}
  end

  def downgrade
    @user = User.find(params[:id])
    authorize @user, :downgrade?
    if @user.update_attributes(role:'standard')
      flash[:notice] = "Your account role is now Standard"
      redirect_to @user
    else
      flash[:error] = "Sorry, something went wrong. Please try again."
      redirect_to edit_user_path(@user)
    end
  end

end