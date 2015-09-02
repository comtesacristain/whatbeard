class Album < ActiveRecord::Base
  has_attached_file :cover, styles: { medium: "200x200>", thumb: "100x100>" },
    path: ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
    url: "/system/:attachment/:id/:basename_:style.:extension",
    default_url: "/images/:style/missing.png"
    
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  
  belongs_to :artist
  has_many :tracks
  
  has_many :recommendations, as: :recommended
  
  def cover_from_url=(url)
    self.cover = URI.parse(url)
  end
end
