class StartWithAnExistingGallery
  def self.called(title)
    new(title)
  end

  def initialize(title)
    @title = title
  end

  def perform_as(actor)
    actor.attempts_to(CreateANewGallery.called(@title))
  end
end