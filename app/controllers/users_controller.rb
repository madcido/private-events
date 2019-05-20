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
      flash[:success] = "User logged in. Welcome back, #{@user.name}."
      session[:id] = @user.id
      redirect_to @user
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @upcoming_events = @user.upcoming_events
    @past_events = @user.past_events
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
