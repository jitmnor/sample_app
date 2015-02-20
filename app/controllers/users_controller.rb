class UsersController < ApplicationController
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def show
    @user = User.find_by_id(params[:id])
    @title =@user.name
  end
end
