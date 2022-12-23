class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: 'DESC')
  end
  
  def new
    @post = Post.new
    
    unless logged_in?
      flash[:danger] = '投稿するには、ログインしてください。'
      redirect_to root_path
    end
  end
  
  def confirm
    @question = Question.new(question_params)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = '投稿が完了しました。'
      redirect_to posts_path
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :url, :language, :content, :comment)
    end
end