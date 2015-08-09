class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    params = post_params
    logger.debug(params)
    params["user_id"] = 1  # TODO
    logger.debug(params)
    @post = Post.new(params)
    @post.save
    redirect_to post_path(@post["id"])
  end

  private

  def post_params
    params[:post].permit(:title, :content)
  end

end
