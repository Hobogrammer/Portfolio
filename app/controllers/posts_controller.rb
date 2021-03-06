class PostsController < ApplicationController
  before_action :authenticate_user! , except: [ :index, :show ]
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def show
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if policy(@post).create?
      if @post.save
        current_user.posts << @post
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render action: 'new'
      end
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_url, notice: 'Post was destroyed'
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, (:published if current_user.role == "editor"))
    end
end
