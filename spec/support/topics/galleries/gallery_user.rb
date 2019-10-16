class GalleryUser < RegisteredUser
  def self.who_is_not_logged_in
    new build(:user)
  end

  def self.with_an_existing_gallery_named(title)
    user = with_correct_login_details
    user.galleries.create(title: title)
    user
  end

  def has_a_gallery_called?(title)
    galleries.where(title: title).exists?
  end

  def has_any_galleries?
    galleries.any?
  end

  def able_to_view_galleries?(*gallery_names)
    gallery_list_page = GalleriesListPage.new
    gallery_list_page.visible_galleries == Array(gallery_names)
  end
end