class Link < ActiveRecord::Base
	mount_uploader :image, ImageUploader	
	has_many :profile_links


 private
    def avatar_size_validation
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
end
