class Gallery
  include Mongoid::Document

  field :title, type: String
  
  belongs_to :user

  validates_presence_of :title
end