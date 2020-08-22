class SubjectsController < ApplicationController
  before_action :confirm_logged_in
  before_action :subject_count, only: [:new, :create, :edit, :update]
  layout 'admin'
  def index
    logger.debug("Testing the logger. *****")
    @subjects = Subject.sorted
    @page_title = "All Subjects"
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
      flash[:notice] = "Subject created successfully"
      redirect_to(subjects_path)
    else
      render 'new'
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id]);
    if @subject.update_attributes(subjects_params)
      flash[:notice] = "Subject updated successfully"
      redirect_to(subject_path(@subject))
    else
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

  def subject_count
      @subject_count = Subject.count
    if(params[:action] == 'new' || params[:action] == 'create')
      @subject_count += 1
    end
  end

  def subjects_params

    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end
end
