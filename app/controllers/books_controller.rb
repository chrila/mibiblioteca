class BooksController < ApplicationController
  def edit
  end

  def index
    @books = Book.all
  end

  def new
  end
end
