class Dream < ActiveRecord::Base
	belongs_to :user 
	#Set up image size in different conditions
	def self.search(search)
		if search
			where(["description LIKE?","%#{search}%"])
		else 
			all
		end
	end
	#Validation: description can't be blank
	validates :description, presence: true
end
