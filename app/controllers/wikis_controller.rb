class WikisController < ApplicationController
  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.create(wiki_params)
    redirect_to @wiki
  end

  def edit
  end

  protected

  def wiki_params
    params.require(:wiki).permit(:title,:body)
  end
end
