class UsersController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @user = current_user
    @users = User.all
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      @user = current_user
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
  end
  
  
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
  
end
