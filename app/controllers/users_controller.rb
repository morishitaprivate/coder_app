class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end
  
  def new
    @user = User.new
  end
  
  def create
    # @user = User.new(name: params[:user][:name], login_id: params[:user][:login_id], password: params[:user][:password],  password_confirmation: params[:user][:password_confirmation]) と同じ。
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '登録に成功しました。'
      log_in @user
      redirect_to root_path
    else
      flash[:danger] = '登録に失敗しました。'
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if current_user != @user
      flash[:danger] = '本人のみ変更することができます。'
      redirect_to user_path(@user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if current_user != @user
      flash[:danger] = '本人のみ変更することができます。'
    else
      if @user.update(user_params)
        flash[:success] = '更新が完了しました'
      else
        flash[:danger] = '更新に失敗しました'
      end
      redirect_to mypage_index_path
    end
    
    redirect_to root_path
  end
  
  def destroy
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :login_id, :password,
                                   :password_confirmation, :age, :introduction)
    end
end