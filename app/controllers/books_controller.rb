class BooksController < ApplicationController
  def index
    redirect_to login_path unless session[:user_id].present?

  # Sortowanie książek
  case params[:sort]
  when 'average_rating'
    @books = Book.includes(:notes).all.sort_by do |book|
      book.notes.any? ? book.notes.average(:note).to_f : 0
    end.reverse
  else
    @books = Book.includes(:notes).all
  end

    # Obliczanie średniej oceny dla każdej książki
    @average_ratings = @books.each_with_object({}) do |book, averages|
      if book.notes.any?
        averages[book.id] = book.notes.average(:note).to_f.round(2)
      else
        averages[book.id] = 'Brak ocen'
      end
    end

    # Obliczanie rankingu dla średnich ocen
    @average_ranks = calculate_avg_rank(@average_ratings)

    @users = User.all
    @notes = Note.includes(:book).all
  end

  private

  def calculate_avg_rank(average_ratings)
    sorted_averages = average_ratings.values.reject { |avg| avg == 'Brak ocen' }.sort.reverse
    ranks = {}

    sorted_averages.each.with_index(1) do |avg, index|
      if ranks.has_key?(avg)
        ranks[avg] << index
      else
        ranks[avg] = [index]
      end
    end

    ranks.each do |avg, indexes|
      avg_rank = indexes.sum.to_f / indexes.size
      ranks[avg] = avg_rank
    end

    average_ratings.transform_values do |avg|
      avg == 'Brak ocen' ? avg : ranks[avg]
    end

  end
end



