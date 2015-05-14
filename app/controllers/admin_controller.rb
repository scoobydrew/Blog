class AdminController < ApplicationController
  before_filter :deny_access, :unless => :is_admin?
  def admin
    @tags = Tag.all
  end
  
  def new_tag
    @tag = Tag.new(tag_params)
  end
  
  protected

  def is_admin?
    user_signed_in? && current_user.role == 'admin'
  end
  
  private
  
  def tag_params
    params.require(:tag).permit(:name)
  end
end
