class UsersController < ApplicationController
  before_action :set_user
  def show
    @user
  end

  def follow
    current_user.following << @user.id
    if current_user.save
      redirect_to @user
    end
  end

  def unfollow
    current_user.following = current_user.following - [ @user.id ]
    if current_user.save
      redirect_to @user
    end
  end

  def follow_request
    @user.follow_request_list << current_user.id
  end

  def notification
    @user.number_of_notifications += 1
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
