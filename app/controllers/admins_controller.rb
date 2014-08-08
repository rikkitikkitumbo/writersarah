class AdminsController < ApplicationController

  def index
    @user_authenticated = user_signed_in?
    @user_email = current_user ? current_user.email : 'nope'
  end

end
