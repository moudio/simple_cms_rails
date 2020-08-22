
class AdminUsersController < ApplicationController
  layout 'admin'

    before_action :confirm_logged_in

  def index
    @users = AdminUser.sorted
  end

  def new
    @user = AdminUser.new
  end

  def create
    @user = AdminUser.new(admin_user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to admin_users_path
    else
      flash.now[:error] = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    @user = AdminUser.find(params[:id])

  end

  def update
    @user = AdminUser.find(params[:id])
    if @user.update_attributes(user_admin_params)
        flash[:notice] = "User updated successfully"
      else
        error_messages_for(@user)
        render 'edit'
    end
  end

  def delete
    @user = AdminUser.find(params[:id])
  end

  def destroy
    @user = AdminUser.find(params[:id])
    @user.destroy
    flash[:notice] = "User destroyed successfully"
    redirect_to admin_users_path
  end

  private
  def admin_user_params
    params.require(:admin_user).permit(:username, :first_name, :email, :last_name, :password, :password_confirmation)
  end
end
