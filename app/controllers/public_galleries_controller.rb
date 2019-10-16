class PublicGalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end
end