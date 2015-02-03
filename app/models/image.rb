class Image < ActiveRecord::Base
	belongs_to :order
	mount_uploader :file, OrderImgUploader
end
