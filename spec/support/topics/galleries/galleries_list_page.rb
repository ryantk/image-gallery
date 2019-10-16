class GalleriesListPage < Page
  def navigate_to_personal
    visit '/'
    click_link 'Your Galleries'
  end

  def navigate_to_public
    visit '/'
  end

  def visible_galleries
    all('.gallery-title').map &:text
  end
end