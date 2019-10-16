class DeleteAGallery < Action
  def self.with_title(title)
    visit '/'
    click_link 'Your Galleries'
    click_link title
    click_button 'Delete this gallery'
  end
end