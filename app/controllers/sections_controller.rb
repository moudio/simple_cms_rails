class SectionsController < ApplicationController
  layout 'admin'
  before_action :confirm_logged_in
  before_action :find_page
  before_action :set_section, only: [:show, :edit, :delete, :destroy, :update]
  before_action :section_count, only: [:new, :create, :edit, :update]
  def index
    @sections = @page.sections.visible.sorted
  end
  def new
    @section = Section.new(:page_id => @page.id)
  end


  def create
    @section = Section.new(section_params)
    @section.page = @page
    if @section.save
        flash[:notice] = "Section updated successfully"
      redirect_to(sections_path(:page_id => @page.id))
    else
      flash[:error] = @section.errors.full_messages
         @section = Section.new(:page_id => @page.id)
      render 'new'
    end
  end

def edit
     @section = Section.find(params[:id] )
end


  def update
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
      redirect_to section_path(@section, :page_id => @page.id)
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

  def find_page
    @page = Page.find(params[:page_id])
  end

  def section_count
    @section_count = @page.sections.count
    if(params[:action] == 'create' || params[:action] == 'new')
      @section_count += 1
    end
  end
def set_section
  @section = Section.find(params[:id])
end



def section_params
  params.require(:section).permit(:name, :position, :visible, :content_type, :content)

end
end
