class PagesController < ApplicationController

  def home
    @title = 'Home'
    @user = User.new unless signed_in?
  end

  def contact
    @title = 'Contact'
  end
end
