class BooksController < ApplicationController
  before_action :set_book!, only: %i[show edit update destroy]
  before_action :set_authors, only: %i[new create]

  def index
    @books = Book.includes(:author)
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book!
    @book = Book.find(params[:id])
  end

  def set_authors
    @authors = Author.all
  end

  def book_params
    params.require(:book).permit(:author_id, :title, :genre, :shelf)
  end
end
