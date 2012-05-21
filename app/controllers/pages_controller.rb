class PagesController < ApplicationController
  layout false, only: [:slide]
  def index
    if signed_in?
      redirect_to user_messages_path(current_user)
    end
  end

  def slide
    if signed_in?
      @users = User.all.shuffle
    else
      redirect_to root_path
    end
  end
end
