class PostsController < ApplicationController
    before_action :get_post, only: [:show, :edit, :update]

    def index
        @posts = Post.all
    end

    def show        
    end

    def new
        @post = Post.new
    end

    def create

    end

    def edit
        
    end

    def update

    end

    private

    def get_post
        @post = Post.find(params[:id])
    end
end