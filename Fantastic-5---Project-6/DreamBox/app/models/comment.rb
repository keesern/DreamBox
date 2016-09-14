class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  #Set up image size in different conditions
	has_attached_file :image, styles: { small: "100x100>", medium: "300x300>", large: "600x600>", thumb: "100x100#"}
	validates_attachment_content_type :image, content_type:  /\Aimage\/.*\Z/
end
