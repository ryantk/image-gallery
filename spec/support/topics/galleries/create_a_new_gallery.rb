class CreateANewGallery
  def self.called(title)
    new(title)
  end

  def initialize(title)
    @title = title
  end

  def perform_as(actor)
    visit '/'
    click_link 'Create new gallery'

    gallery = CreateGalleryPage.new
    gallery.title = @title
    gallery.create
  end
end