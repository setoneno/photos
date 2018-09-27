class ToppagesController < ApplicationController
  def index
    if logged_in?
      @photo = current_user.photos.build  # form_for 用
      @photos = current_user.photos.order('created_at DESC').page(params[:page])
    end
  end
end
