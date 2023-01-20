class MypageController < ApplicationController
  def index
    
    unless logged_in?
      flash[:danger] = 'マイページはログイン後にみることができます。'
      redirect_to root_path
    else
      @user = current_user
      @posts = Post.where(user_id: current_user.id)
    end
  end
end
