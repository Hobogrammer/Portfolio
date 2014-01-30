class CommentsController < ApplicationController
  before_action :load_post, only: [:create]

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post), success: "Comment submitted for moderation"
    else
      redirect_to post_path(@post), notice: "Comment could not be created"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
