class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(nick: params[:session][:nick])
    session[:user_id] = user.id
    redirect_to books_path, notice: 'Zalogowano pomyślnie.'
  end
end
