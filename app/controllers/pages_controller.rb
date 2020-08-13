class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new 
  end


  def create
  end

  def show

  end

  def edit
  end

  def delete
  end
end
