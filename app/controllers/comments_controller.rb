class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_commentable, only: [:create]

  def create
    @comment = @commentable.comments.new(comment_params)
    current_user.name.present? ? @comment.author = current_user.name : @comment.author = current_user.email

    if @comment.save
      redirect_to @commentable, success: "Comment submitted for moderation"
    else
      redirect_to @commentable, notice: "Comment could not be created"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :commentable_id, :commentable_type, :author)
    end

    def load_commentable
      @resource, id = request.path.split('/')[1,2]
      @commentable = @resource.singularize.classify.constantize.find(id)
    end
end
