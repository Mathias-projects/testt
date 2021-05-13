class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    @messages = Message.all
    json_response(@messages)
  end

  def create
    @message = Message.create!(message_params)
    json_response(@message, :created)
  end

  def show
    json_response(@message)
  end

  def update
    @message.update(message_params)
    json_response("changed", :ok)
  end

  def destroy
    @message.destroy
    json_response("deleted", :ok)
  end

  private

  def message_params
    params.permit(:content)
  end

  def set_message
    @message = Message.find(params[:id])
  end


end
