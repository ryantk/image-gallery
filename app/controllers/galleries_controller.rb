class GalleriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @gallery = current_user.galleries.new
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)
    if @gallery.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def index
    @galleries = current_user.galleries
  end

  def show
    @gallery = Gallery.find(params[:id])
    @photos = @gallery.photos
  end

  def edit
    @gallery = current_user.galleries.find(params[:id])
  end

  def update
    @gallery = current_user.galleries.find(params[:id])
    if @gallery.update(gallery_params)
      redirect_to @gallery
    else
      render :edit
    end
  end

  def destroy
    @gallery = current_user.galleries.find(params[:id])
    if @gallery.destroy
      redirect_to galleries_path
    else
      render @gallery
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:title)
  end
end