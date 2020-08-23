class SectionsController < ApplicationController
  layout 'admin'
  before_action :confirm_logged_in
  before_action :find_page 
  before_action :set_section, only: [:show, :edit, :delete, :destroy, :update]
  before_action :section_count, only: [:new, :create, :edit, :update]
  before_action :find_pages, only: [:new, :create, :edit, :update]
  def index
    @sections = Section.all
  end
  def new
    @section = Section.new
  end


  def create
    @section = Section.new(section_params)
    if @section.save
        flash[:notice] = "Section updated successfully"
      redirect_to(sections_path)
    else
      flash[:error] = @section.errors.full_messages
         @section = Section.new
      render 'new'
    end
  end

def edit
     @section = Section.new
end


  def update
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
      redirect_to section_path(@section)
      else
           @section = Section.new
      @section_count = Section.count
        render 'edit'
    end
  end

  def show
  end

  def delete
  end

  def destroy
    @section.destroy
    flash[:notice] = "Section '#{@section.name}' destroyed successfully"
    redirect_to section_path
  end

  private

  def find_pages
    @pages = Page.sorted
  end

  def section_count
    @section_count = Section.count
    if(params[:action] == 'create' || params[:action] == 'new')
      @section_count += 1
    end
  end
def set_section
  @section = Section.find(params[:id])
end


def section_params
  params.require(:section).permit(:name, :position, :visible, :content_type,:page_id, :content)

end
end
