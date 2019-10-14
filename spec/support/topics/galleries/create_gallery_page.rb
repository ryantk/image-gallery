class CreateGalleryPage < Page
  def title=(title)
    fill_in 'Title', with: title
  end

  def create
    click_button 'Create gallery'
  end
end