class HomeController < ApplicationController
  def index
    @posts = Post.all.order(id: 'DESC').limit(10)
    @users = User.joins(:posts).group(:user_id).order('count(*) desc').limit(10)
  end
end
