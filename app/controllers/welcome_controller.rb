class WelcomeController < ApplicationController
  def index
    @wikis = Wiki.recent(10)
    @users = User.recent_with_wikis(10)

    @stripe_btn_data = {
      key: "#{ENV['STRIPE_PUBLISHABLE_KEY']}",
      description: "Upgrade to Premium",
      amount: Amount.default
    }
  end

  def about
  end
end
