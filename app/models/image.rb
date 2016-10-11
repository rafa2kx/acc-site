class Image < ActiveRecord::Base
  has_attached_file :content, :styles => { :medium => "400x400>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :content, :content_type => /\Aimage\/.*\Z/
  belongs_to :article
end
