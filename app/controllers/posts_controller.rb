class PostsController < ApplicationController

    def show
        @post = Post.all.find(params[:id])
    end
    
    def update 
        @post = Post.update(post_params)
    end

    def new
        @post = Post.new()
    end

    def create
        @post = Post.new(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            redirect_to new_post_path
        end
    end

    def like
        @post = Post.find(params[:id])
        @post.update(id: @post.id, title: @post.title, content: @post.content, likes:@post.likes+1, blogger_id: @post.blogger_id, destination_id: @post.destination_id )
        @post.save
        redirect_to post_path(@post)
    end

    def post_params
        params.require(:post).permit(
            :id,
            :title,
            :content,
            :likes,
            :blogger_id,
            :destination_id
        )
    end

end
