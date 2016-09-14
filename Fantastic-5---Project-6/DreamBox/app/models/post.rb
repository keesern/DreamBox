class Post < ActiveRecord::Base
	# Set rules for post controller 
	#posts belongs to user
	belongs_to :user 
	#Set up image size in different conditions
	has_attached_file :image, styles: { small: "100x100>", medium: "300x300>", large: "600x600>", thumb: "100x100#"}
	validates_attachment_content_type :image, content_type:  /\Aimage\/.*\Z/
	#User can have many comments
	has_many :comments
	#Validation: Name and description can't be blank
	validates :name, presence: true
	validates :description, presence: true
	
	#TEST!
	#>> name = Post.new
	# => #<Person id: nil, name: nil>
	#>> name.errors.messages
	# => {}
	 
	#>> name.valid?
	# => false
	#>> name.errors.messages
	# => {name:["can't be blank"]}
	 
	#>> name = Post.create
	# => #<Person id: nil, name: nil>
	#>> name.errors.messages
	# => {name:["can't be blank"]}
	 
	#>> name.save
	# => false
	 
	#>> name.save!
	# => ActiveRecord::RecordInvalid: Validation failed: Name can't be blank
	 
	#>> Post.create!
	# => ActiveRecord::RecordInvalid: Validation failed: Name can't be blank
end
