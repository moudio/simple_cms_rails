class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
  end

  def edit
  end

  def delete
  end
end
