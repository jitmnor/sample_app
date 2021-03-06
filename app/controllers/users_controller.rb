class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @title =@user.name
  end
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    #raise params[:user].inspect
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      #redirect_to user_path(@user.id)
      #redirect_to user_path(@user)
      redirect_to @user
    else
      @title = "Sign up"
      render :new
    end
  end
  
end
