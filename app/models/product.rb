class Product < ApplicationRecord
	mount_uplouder :image, ImageUploader
	belongs_to :category 
end
