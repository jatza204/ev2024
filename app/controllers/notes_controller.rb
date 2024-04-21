class NotesController < ApplicationController
  before_action :set_book, only: [:create, :update]

  def create
    @note = @book.notes.build(note_params)
    @note.user = current_user.nick if current_user
    respond_to do |format|
      if @note.save
        format.html { redirect_to books_path, notice: 'Ocena została dodana.' }
        format.js   # Dodaje obsługę odpowiedzi JavaScript.
      else
        format.html { render 'books/index', status: :unprocessable_entity }
        format.js   # Możesz tutaj dodać obsługę błędów dla AJAX.
      end
    end
  end

  def update
    @note = @book.notes.find(params[:id])
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to books_path, notice: 'Ocena została zaktualizowana.' }
        format.js   # Dodaje obsługę odpowiedzi JavaScript.
      else
        format.html { render 'books/index', status: :unprocessable_entity }
        format.js   # Możesz tutaj dodać obsługę błędów dla AJAX.
      end
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def note_params
    params.require(:note).permit(:note, :user) # Zakładam, że pole w bazie nazywa się `note`.
  end
end
