class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def publish?
    @user.role == "editor"
  end

  def create?
    @user.role == "author" or @user.role == "editor"
  end
end
