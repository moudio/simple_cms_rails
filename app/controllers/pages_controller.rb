class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end


  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully"
      redirect_to(pages_path)
    else

      render 'new'
    end
  end

  def show

  end

  def edit
  end

  def delete
  end

  private
  def page_params
    params.require(:page).permit(:name, :permalink, :position, :visible)
  end
end
