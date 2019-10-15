class EditGallery < Action
  def self.with_title(title)
    visit '/'
    click_link 'View Galleries'
    click_link title
    click_link 'Edit'
    new
  end

  def change_title_to(new_title)
    edit_gallery = EditGalleryPage.new
    edit_gallery.title = new_title
    edit_gallery.submit
    self
  end
end