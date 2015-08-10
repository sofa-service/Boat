class CommentsController < ApplicationController

  def create
    create_params = comment_params
    create_params["user_id"] = current_user.id  # TODO
    create_params["post_id"] = params[:id]
    logger.debug(params)

    @comment = Comment.new(create_params)
    @comment.save
    redirect_to post_path(@comment["post_id"])
  end

  private

  def comment_params
    params[:comment].permit(:content)
  end

end
