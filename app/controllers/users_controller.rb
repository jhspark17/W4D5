class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(user_params)
    
    if user.save!
      redirect_to user_url(user)
    else
      render json: "sucks to suck"
    end
  end

  def show
    user = User.find(params[:id])

    render json: user
  end 

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end