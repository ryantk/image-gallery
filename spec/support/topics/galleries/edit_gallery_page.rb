class EditGalleryPage < Page
  def title=(title)
    fill_in 'Title', with: title
  end
  
  def submit
    click_button 'Save changes'
  end
end