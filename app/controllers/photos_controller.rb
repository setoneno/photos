class PhotosController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @photos = current_user.feed_photos.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @photo.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def photo_params
    params.require(:photo).permit(:content, :image) 
  end

  def correct_user
    @photo = current_user.photos.find_by(id: params[:id])
    unless @photo
      redirect_to root_url
    end
  end
end