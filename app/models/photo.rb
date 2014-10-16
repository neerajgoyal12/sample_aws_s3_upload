class Photo < ActiveRecord::Base
  has_attached_file :image,
                    :storage => :s3,
                    styles:  { 
      	                        thumb: '100x100>',
      	                        mobile: '320x320>',
      	                        large: '640x640>'
                             }
    validates_attachment_content_type :image, :content_type  => /\Aimage\/.*\Z/
    validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /PNG\Z/, /JPE?G\Z/]
    
    after_post_process :after_processing
    before_post_process :before_processing
    
    def after_processing
      puts "************"
      puts "After processing"
      puts "************"
    end
    
    def before_processing
      puts "************"
      puts "before processing"
      puts "************"
    end
end
