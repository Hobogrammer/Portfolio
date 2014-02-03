class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initlaize(user,comment)
    @user = user
    @comment = comment
  end

  def create?
    return unless @user.present?
    @user.user? || @user.author? || @user.editor?
  end

  def destroy?
    return unless @user.present?
    @user.editor? || @user.author?
  end

  def  update?
    return unless @user.present?
      @user.editor? || @user.author?
  end

  def approve?
    return unless @user.present?
      @user.editor? || @user.author?
  end
end
