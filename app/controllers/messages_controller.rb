class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  before_filter :validate_user#, only: [:index, :new, :edit, :create, :destroy, :update]

  def index
    @messages = current_user.messages

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  #def show
  #  @message = Message.find(params[:id])

  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @message }
  #  end
  #end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = current_user.messages.build(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to user_messages_path(current_user), notice: 'Message was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to user_messages_path(current_user), notice: 'Message was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to user_messages_url }
      format.json { head :no_content }
    end
  end

  private

  def validate_user
    if current_user.id != params[:user_id].to_i
      redirect_to root_path
    end
  end
end
