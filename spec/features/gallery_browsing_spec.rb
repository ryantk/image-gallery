require 'rails_helper'

feature 'All users can view photo galleries' do

  scenario 'Users may view galleries of another user' do
    gareth = GalleryUser.with_an_existing_gallery_named('Photos A')
    bert = GalleryUser.with_an_existing_gallery_named('Great gallery')
    dobby = GalleryUser.with_an_existing_gallery_named('Corfu 06')
    kate = GalleryUser.who_is_logged_in

    galleries_list_page = GalleriesListPage.new
    galleries_list_page.navigate_to_public

    expect(kate).to be_able_to_view_galleries(
      'Photos A',
      'Great gallery',
      'Corfu 06'
    )
  end

  scenario 'Unauthenticated users can view all galleries' do
    create(:gallery, title: 'My photos')
    create(:gallery, title: 'Ace moments')
    create(:gallery, title: '1st Birthday')

    galleries_list_page = GalleriesListPage.new
    galleries_list_page.navigate_to_public

    expect(galleries_list_page.visible_galleries).to eq([
      'My photos',
      'Ace moments',
      '1st Birthday'
    ])
  end

  scenario 'Unauthenticated users can view photos in a gallery' do
    create(:gallery, title: 'My photos')
    create(:gallery, title: 'Ace moments')
    create(:gallery, title: '1st Birthday')

    VisitGallery.named('Ace moments')

    expect(page).to have_content('Ace moments')
  end
  
  scenario 'Users can view their own personal galleries serparatly' do
    gareth = GalleryUser.with_an_existing_gallery_named('Photos A')
    bert = GalleryUser.with_an_existing_gallery_named('Great gallery')
    dobby = GalleryUser.with_an_existing_gallery_named('Corfu 06').who_is_logged_in

    galleries_list_page = GalleriesListPage.new
    galleries_list_page.navigate_to_personal

    expect(galleries_list_page.visible_galleries).to eq(['Corfu 06'])
  end

end