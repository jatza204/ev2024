class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :initialize_chat

  private

  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end

  def initialize_chat
    # Initialize the global variable if it doesn't exist
    $chat_messages ||= []
  end

  helper_method :current_user

  def current_user
    @current_user
  end
end

  