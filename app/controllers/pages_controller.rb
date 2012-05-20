class PagesController < ApplicationController
  layout false, only: [:slide]
  def index
    if signed_in?
      redirect_to user_messages_path(current_user)
    end
  end
  def slide
    @messages = Message.all
  end
end
