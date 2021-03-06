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
    return unless @user.present?
    @user.editor? || @user.author?
  end

  def destroy?
    return unless @user.present?
    @user.editor?
  end

  def update?
    return unless @user.present?
    @user.editor? || @user.author?
  end
end
