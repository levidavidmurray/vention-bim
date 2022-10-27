class BooksController < ApplicationController

  before_action :set_book, only: [:edit, :update, :destroy]
  before_action :set_author, only: [:create, :update]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @authors = Author.all
  end

  def create
    Book.create(
      title: book_params[:title], 
      year: book_params[:year],
      author: @author
    )
    redirect_to books_path
  end

  def edit
  end

  def update
    @book.update(
      title: book_params[:title], 
      year: book_params[:year],
      author: @author
    )
    redirect_to books_path
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def set_author
    @author = Author.find(params[:author_id])
  end

  def book_params
    params.require(:book).permit(:title, :year)
  end

end
