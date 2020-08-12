class SubjectsController < ApplicationController
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})
  end

  def create
    @subject = Subject.new(subjects_params);
    if @subject.save
      redirect_to(subjects_path)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end
  private
  def subjects_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
