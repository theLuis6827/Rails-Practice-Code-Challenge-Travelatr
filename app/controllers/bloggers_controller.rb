class BloggersController < ApplicationController

    def new
        @blogger = Blogger.new
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.valid?
            @blogger.save
            redirect_to @blogger
        else
            redirect_to new_blogger_path
        end
    end

    def blogger_params
        params.require(:blogger).permit(
            :name,
            :bio,
            :age
        )
    end

end
