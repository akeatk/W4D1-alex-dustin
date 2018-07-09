class UsersController < ApplicationController
  def index
    render json: params
  end
  
  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_messages, status: 404
    end
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201
    else
      render json: user.errors.full_messages, status: 422
    end
  end
  
  def update
    user = User.find(params[:id])
    if user.save
      render json: user, status: 200
    else
      render json: user.errors.full_messages, status: 422
    end
  end
  
  def destroy
    user = User.find(params[:id])
    if user
      user.destroy
      render json: user
    else
      render json: user.errors.full_messages, status: 404
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name)
  end
end