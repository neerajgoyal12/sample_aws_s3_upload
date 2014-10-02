class Photo < ActiveRecord::Base
  
  has_attached_file :image, styles:  { 
    	thumb: '100x100>',
    	mobile: '320x320>',
    	large: '640x640>'
    }
    validates_attachment_content_type :image, :content_type  => /\Aimage\/.*\Z/
    # validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
end
