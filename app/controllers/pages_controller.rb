class PagesController < ApplicationController
  def index
    if signed_in?
      redirect_to user_messages_path(current_user)
    end
  end
end
