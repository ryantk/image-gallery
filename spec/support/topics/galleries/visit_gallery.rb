class VisitGallery < Action
  def self.named(name)
    visit '/'
    click_link name
    new
  end

  attr_reader :page

  def initialize
    @page = GalleryPage.new  
  end

  def and_upload(photo_path)
    page.upload_photo(photo_path)
    page.submit
  end
end