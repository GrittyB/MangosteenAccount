class UsersController < ApplicationController
  def show
    user = User.find_by_id params[:id]
    if user
      render json: user
    else 
      head 404
    end
  end

  def create
    user = User.new email: 'xx@xx.com', name: 'xx'
    if user.save 
      render json: user
    else 
      render json: user.errors
    end
  end
end