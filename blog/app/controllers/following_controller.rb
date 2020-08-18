 class FollowingController < ApplicationController
  before_action :logged_in_user, :load_user

  def index
    @users = @user.following.page(params[:page]).per Settings.user.per_page
    render "users/show_follow"
  end
end
