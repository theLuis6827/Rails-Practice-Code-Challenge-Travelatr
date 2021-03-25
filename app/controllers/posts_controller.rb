class PostsController < ApplicationController

    def show
        @post = Post.all.find(params[:id])
    end
    
    def update 
        @post = Post.update(post_params)
    end

    def like
        @post = Post.all.find(params[:id])
        @post.update(id: @post.id, title: @post.title, content: @post.content, likes:@post.like+1, blogger_id: @post.blogger_id, destination_id: @post.destination_id )
        @post.save
        redirect_to post_path(@post)
    end

    def post_params
        params.require(:blogger).permit(
            :id,
            :title,
            :content,
            :likes,
            :blogger_id,
            :destination_id
        )
    end

end
