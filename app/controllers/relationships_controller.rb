class RelationshipsController < ApplicationController
  before_action :authenticate_user
  before_action :forbid_following_yourself
  
  
  def create
    user = User.find_by(id: params[:followed_id])
    @current_user.follow(user)
    redirect_to("/users/#{user.id}")
  end

  def destroy
    user = User.find_by(id: params[:followed_id])
    @current_user.unfollow(user)
    redirect_to("/users/#{user.id}")
  end
  
  def forbid_following_yourself
    if @current_user.id == params[:followed_id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end
  
  
end
