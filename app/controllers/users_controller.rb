class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = 'Sign-up successful!'
      redirect_to(root_path)
    else
      @title = 'Home'
      render 'pages/home'
    end
  end
end
