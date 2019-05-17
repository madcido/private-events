class UsersController < ApplicationController

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created. Welcome, #{@user.name}."
      session[:id] = @user.id
      redirect_to @user
    else
      @user = User.find_by(user_params)
      flash[:success] = "Welcome back, #{@user.name}."
      session[:id] = @user.id
      redirect_to @user
    end
  end
  
  def show
    @user = User.find_by(params[:id])
  end

  def destroy
    session.delete(:id)
    current_user = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
