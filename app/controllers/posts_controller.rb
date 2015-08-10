class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.user_id)

    @comments = @post.comments
    @comments.each {|comment| comment.user = User.find(comment.user_id)}

    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    create_params = post_params
    create_params["user_id"] = current_user.id  # TODO

    @post = Post.new(create_params)
    @post.save
    redirect_to post_path(@post["id"])
  end

  private

  def post_params
    params[:post].permit(:title, :content)
  end

end
