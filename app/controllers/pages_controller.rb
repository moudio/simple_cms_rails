class PagesController < ApplicationController

  layout 'admin'
  # a filter is a code that runs before or after the excecution of an action
  before_action :confirm_logged_in
  before_action :find_subjects, only: [:new, :create, :edit, :update]
  before_action :set_page_count, only: [:new, :create, :edit, :update]
  def index
    @pages = Page.sorted
  end

  def new
    @page = Page.new
    @page_count = Page.count + 1
  end


  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully"
      redirect_to(pages_path)
    else
      flash[:error] = @page.errors.full_messages
        @page_count = Page.count + 1
      render 'new'
    end
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully"
      redirect_to(page_path(@page))
    else
      render 'edit'
    end
  end

  def delete
      @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' destroyed successfully"
    redirect_to(pages_path)
  end

  private

def set_page_count
  @page_count = Page.count
  if params[:action] == 'new' || params[:action] == 'create'
    @page_count += 1
  end
end
  # we define the find_subject as a private method to avoid having it to be called outside of the controller by a request for example
  def find_subjects
    @subjects = Subject.sorted
  end

  def page_params
    params.require(:page).permit(:name, :permalink, :position, :visible, :subject_id)
  end
end
