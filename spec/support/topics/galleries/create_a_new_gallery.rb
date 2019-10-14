class CreateANewGallery < Action
  def self.with_title(title)
    visit '/'
    click_link 'View Galleries'
    click_link 'Create new gallery'

    gallery = CreateGalleryPage.new
    gallery.title = title
    gallery.create
  end
end