class SessionsController < ApplicationController

  def create
    user = User.first(conditions: { email: params[:email] })

    if user && user.authenticate(params[:password])
      session[:user_id] = user._id
      flash[:success] = 'Signed-in successfully'
      redirect_to root_path
    else
      flash[:error] = 'Invalid credentials'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Signed-out successfully'
    redirect_to root_path
  end
end
