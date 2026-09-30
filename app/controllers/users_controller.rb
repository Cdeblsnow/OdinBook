class UsersController < ApplicationController
  before_action :set_user, except: [ :index ]
  # use after action to add notifications

  def index
    already_following = current_user.following
    @user = User.where.not(id: already_following)
  end
  def show
    @user
  end

  def follow
    @user.following << current_user.id
    current_user.followed_by << @user.id
    if @user.save && current_user.save
      remove_from_list(@user)
      redirect_to current_user
    end
  end

  def unfollow
    current_user.following = current_user.following - [ @user.id ]
    @user.followed_by =  @user.followed_by - [ current_user.id ]
    if @user.save && current_user.save
      redirect_to @user
    end
  end

  def remove_from_list(user)
    current_user.follow_request_list = current_user.follow_request_list - [ user.id ]
    current_user.save
  end

  def cancel_follow_request
    @user.follow_request_list = @user.follow_request_list - [ current_user.id ]
    if @user.save
      redirect_to @user
    end
  end

  def follow_request
    @user.follow_request_list << current_user.id
    if @user.save
      redirect_to @user
    end
  end

  def reset_notifications
    current_user.notifications = []
    current_user.save

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.turbo_stream { render turbo_stream: turbo_stream.refresh }
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end
end
