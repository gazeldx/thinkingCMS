class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path, notice: t('book.created')
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to books_path, notice: t('book.updated')
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :writer_id, :summary)
  end
end
