class BooksController < ApplicationController
  before_action :set_book, only: %i[edit show update destroy]

  def index
    @q = Book.all.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)

    if @book.save
      redirect_to books_path, notice: 'Book was successfully created.'
    else
      flash.now[:alert] = 'Book cannot be created.'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: 'Book was successfully updated.'
    else
      flash.now[:alert] = 'Book cannot be updated.'
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully deleted.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :status, :lend_date, :return_date)
  end
end
