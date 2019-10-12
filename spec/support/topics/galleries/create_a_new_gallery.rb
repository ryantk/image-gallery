class CreateANewGallery < Action
  def self.as(user)
    visit '/'
    click_link 'Create new gallery'

    gallery = CreateGalleryPage.new
    gallery.title = user.gallery_title
    gallery.create
  end
end