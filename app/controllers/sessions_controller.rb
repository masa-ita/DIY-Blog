# encoding: UTF-8
class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "ログインしました"
    else
      flash.now.alert = "メールアドレスまたはパスワードが正しくありません"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "ログアウトしました"
  end
end
