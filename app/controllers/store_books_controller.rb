class StoreBooksController < ApplicationController
  before_action :set_store_book, only: [:show, :destroy, :add_stock, :remove_stock]
  before_action :set_store, only: [:create]

  def index
    store = Store.find(params[:store_id])
    @store_books = store.store_books
  end

  def show
  end

  def create
    @book = Book.find(params[:book_id])
    @store_book = @store.store_books.create(book: @book)
  end

  def destroy
    @store = @store_book.store
    @store_book.destroy

    # store_book was removed from store_books/add_books
    # render add_book_list_item
    if params.has_key?(:added)
      render partial: 'store_books/add_book_list_item', locals: { book: @store_book.book, store: @store }
      return
    end

    redirect_to action: 'index', store_id: @store.id
  end

  def add_stock
    @store_book.update(count: @store_book.count + 1)
    render :show
  end

  def remove_stock
    @store_book.update(count: [@store_book.count - 1, 0].max)
    render :show
  end

  def add_books
    @store = Store.find(params[:store_id])
    @books = Book.not_in_store(@store.id)
  end

  private

  def set_store_book
    @store_book = StoreBook.find(params[:id])
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

end
