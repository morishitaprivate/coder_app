class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(login_id: params[:session][:login_id].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'ログインに成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインID、またはパスワードが異なります。'
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
