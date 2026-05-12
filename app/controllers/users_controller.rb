class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def follow
    current_user.follow << @user.id
  end
end
