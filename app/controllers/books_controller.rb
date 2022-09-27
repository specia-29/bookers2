class BooksController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end


  def show
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @user = current_user.id
    @book.save
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
