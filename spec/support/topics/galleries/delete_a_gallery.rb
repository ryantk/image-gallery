class DeleteAGallery < Action
  def self.with_title(title)
    visit '/'
    save_and_open_page
    click_link 'View galleries'
    click_link title
    click_button 'Delete gallery'
  end
end