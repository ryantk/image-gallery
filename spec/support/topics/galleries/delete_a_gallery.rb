class DeleteAGallery < Action
  def self.with_title(title)
    visit '/'
    click_link 'View Galleries'
    click_link title
    click_button 'Delete this gallery'
  end
end