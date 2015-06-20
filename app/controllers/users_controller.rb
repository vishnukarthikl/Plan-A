class UsersController < ApplicationController
  before_action :set_user

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html {
          flash[:success] = "Profile updated successfully"
          redirect_to current_user_path
        }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_city)
  end

  private
  def set_user
    @user= current_user
  end
end
