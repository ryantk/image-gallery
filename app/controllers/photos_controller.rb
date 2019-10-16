class PhotosController < ApplicationController

  def create
    debugger

    gallery = Gallery.find(params[:folder_id])

    if gallery.upload_photo(params[:file])

    end
  end

end
