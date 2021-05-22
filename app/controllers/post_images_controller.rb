class PostImagesController < ApplicationController
  def new
      @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    book.save
    redirect_to post_images_path
  end

  def index
    @book = Book.new

  end

  def show
  end

  def destroy
  end
    private

    def book_params
    params.require(:book).permit(:title,:body)
    end
end
