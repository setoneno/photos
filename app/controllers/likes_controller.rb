class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    photo = Photo.find(params[:photo_id])
    current_user.like(photo)
    flash[:success] = 'LIKE'
    redirect_back(fallback_location: root_url)
  end
   def destroy
    photo = Photo.find(params[:photo_id])
    current_user.unlike(photo)
    flash[:success] = 'UnLIKE。'
    redirect_back(fallback_location: root_url)
   end
end