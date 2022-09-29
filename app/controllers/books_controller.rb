class BooksController < ApplicationController

  def index
    @user = current_user
    @book0 = Book.new
    # @book = Book.find(params[:id])
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
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
