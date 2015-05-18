class WelcomeController < ApplicationController
  include StripeData

  def index
    @wikis = Wiki.recent(10)
    @users = User.recent_with_wikis(10)
  end

  def about
  end
end
