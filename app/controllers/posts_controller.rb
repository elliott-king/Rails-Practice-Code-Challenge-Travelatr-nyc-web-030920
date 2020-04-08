class PostsController < ApplicationController
    before_action :get_post, only: [:show, :edit, :update, :like]

    def index
        @posts = Post.all
    end

    def show        
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.likes = 0

        if @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
        @post.update(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :edit 
            # ?
        end
    end

    def like
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end

    private

    def get_post
        @post = Post.find(params[:id])
    end
    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end