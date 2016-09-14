class CommentsController < ApplicationController
 # Set rules for comment controller 
  before_action :authenticate_user!
	def create 
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:comment,:image))
		@comment.user_id = current_user.id if current_user
		@comment.save

		
		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def destroy 
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
	def edit
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		if @comment.update(params[:comment].permit(:comment, :image))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end
end
