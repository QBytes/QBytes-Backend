class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :update]
  before_action :correct_user, only: [:destroy, :update]

  def index
    @posts = Post.all
    render json: @posts 
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      render json: @post
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def update
    if @post.update_attributes(post_params)
      render json: @post
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      render json: @post, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :url, :picture)
  end

  def correct_user
    @post = current_user.posts.find_by(id:params[:id])
    render nothing: true, status: :unauthorised if @post.nil?
  end
end
