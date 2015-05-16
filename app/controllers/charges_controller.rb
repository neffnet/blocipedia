class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ENV['STRIPE_PUBLISHABLE_KEY']}",
      description: "Premium membership for: #{current_user.name}, #{current_user.email}",
      amount: Amount.default
    }
  end

  def create
    #create a Stripe Customer object to associate with this charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: Amount.default,
      description: "Premium membership for: #{current_user.name}, #{current_user.email}",
      currency: 'usd'
      )

    flash[:notice] = "Thanks a lot, #{current_user.name}!"
    current_user.update_attributes(role: 'premium')
    redirect_to user_path(current_user)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end