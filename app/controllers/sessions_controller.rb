class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(id: session[:user_id])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destory
  end
end