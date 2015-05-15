class WelcomeController < ApplicationController
  def index
    @wikis = Wiki.recent(10)
    @users = User.recent(10)
  end

  def about
  end
end
