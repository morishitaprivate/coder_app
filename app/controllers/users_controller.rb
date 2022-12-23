class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @questions = Question.where(user_id: @user.id)
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
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = '更新が完了しました'
      redirect_to root_path
      # redirect_to mypage_index_path
    else
      flash[:danger] = '更新に失敗しました'
      render 'edit'
    end
  end
  
  def destroy
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :login_id, :password,
                                   :password_confirmation, :age, :introduction)
    end
end