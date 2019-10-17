class PhotosController < ApplicationController

  def create
    gallery = Gallery.find(params[:gallery_id])

    unless gallery.upload_photo(params[:file])
      flash[:alert] = "Failed to save upload, please try again in a moment."
    end

    redirect_to gallery
  end

end
