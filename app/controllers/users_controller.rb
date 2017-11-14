class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show,:update, :destroy]
  
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create 
    @user = User.new(user_params)
      if @user.save
      	redirect_to users_path, notice: 'User created successfully'
      else
        flash.now[:alert] = 'User not created' 
        render 'new'
      end   	
  end	

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
    	redirect_to users_path, notice: 'User updated successfully'
    else
      flash.now[:alert] = 'User not updated' 
      render 'edit'
    end   	
  end	

  def destroy
  	@user.destroy
  	  redirect_to users_path, notice: 'User deleted successfully'
  end
  
  private

  def set_user
    @user = User.find(params[:id])	
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end	
end
