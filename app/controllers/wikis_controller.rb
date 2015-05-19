class WikisController < ApplicationController

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.create(wiki_params)
    authorize @wiki

    if @wiki.save
      redirect_to @wiki
    else
      flash[:error] = @wiki.errors
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki updated!"
      redirect_to @wiki
    else
      flash[:error] = @wiki.errors
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "The wiki \"#{@wiki.title}\" has been deleted"
      redirect_to user_path(@wiki.owner)
    else
      flash[:error] = "We messed up. Please try again, or contact us"
      render :show
    end
  end

  protected

  def wiki_params
    params.require(:wiki).permit(:title,:body,:private,:contributor_ids => [])
  end

end
