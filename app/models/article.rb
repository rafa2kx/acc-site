class Article < ActiveRecord::Base
  has_many :images
  before_save :generate_slug

  def generate_slug
    self.slug =  SecureRandom.hex(5)
  end
end
