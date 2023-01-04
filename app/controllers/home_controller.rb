class HomeController < ApplicationController
  def index
    @posts = Post.preload(:user).order(id: 'DESC').limit(10)
    @users = User.joins(:posts).group(:user_id).order('count(*) desc').limit(10)
    # 使用言語別投稿数を降順に並べている
    @chart = Post.language.options.map{|lang| [lang.first,Post.where(language: lang).count]}.sort{|x,y| y.second <=> x.second }
  end
end
