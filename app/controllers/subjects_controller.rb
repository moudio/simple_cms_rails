class SubjectsController < ApplicationController
  layout 'admin'
  def index
    @subjects = Subject.sorted
    @page_title = "All Subjects"
  end

  def show
    @subject = Subject.find(params[:id])

  end

  def new
    @subject = Subject.new({:name => 'Default'})
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subjects_params);
    if @subject.save
      flash[:notice] = "Subject created successfully"
      redirect_to(subjects_path)
    else
      @subject_count = Subject.count + 1
      render 'new'
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject = Subject.find(params[:id]);
    if @subject.update_attributes(subjects_params)
      flash[:notice] = "Subject updated successfully"
      redirect_to(subject_path(@subject))
    else
    @subject_count = Subject.count 
      render 'edit'
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully"
    redirect_to(subjects_path)
  end
  private
  def subjects_params

    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end
end
