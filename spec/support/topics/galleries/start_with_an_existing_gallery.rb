class StartWithAnExistingGallery
  def self.called(title)
    new(title)
  end

  def initialize(title)
    @title = title
  end

  def perform_as(actor)
    # TODO: not sure i should be tying this to StartWithAnExistingUser
    user = StartWithAnExistingUser.as(actor).user
    user.galleries.create(title: @title)
  end
end