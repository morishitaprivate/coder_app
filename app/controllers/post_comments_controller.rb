class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.post_id = @post.id
    if @post_comment.save
      flash[:success] = '投稿が完了しました。'
    else
      flash[:danger] = '投稿に失敗しました。'
    end
    
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:id])
    
    if current_user != @post_comment.user
      flash[:danger] = '投稿主のみが削除できます。'
    else
      @post_comment.destroy
      flash[:success] = '削除が完了しました。'
    end
    
    redirect_to post_path(@post)
  end
  
  private
    def post_comment_params
      params.require(:post_comment).permit(:content)
    end
end
