class DeleteAGallery < Action
  def self.called(title)
    new(title)
  end

  def initialize(title)
    @title = title
  end

  def perform_as(actor)
    visit '/'
    click_link 'View Galleries'
    click_link @title
    click_button 'Delete gallery'
  end
end