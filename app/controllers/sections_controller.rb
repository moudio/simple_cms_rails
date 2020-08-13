class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :delete, :destroy, :update]
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
      render 'new'
    end
  end

def edit
end


  def update

    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
      redirect_to section_path(@section)
      else
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
def set_section
  @section = Section.find(params[:id])
end

def section_params
  params.require(:section).permit(:name, :position, :visible, :content_type,:page_id, :content)

end
end
