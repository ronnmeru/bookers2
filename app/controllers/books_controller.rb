class BooksController < ApplicationController
 before_action :authenticate_user!

 def top
 end

  def new
      @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @books = Book.all
   if @book.save
      flash[:notice]= 'You have created book successfully.'
    redirect_to book_path(@book.id)
   else
    @book_each=Book.all
    render action: :index
   end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @user = current_user
    if  @book.update(book_params)
       flash[:update]='You have updated book successfully.'
       redirect_to book_path(@book.id)
    else
       render action: :edit
    end
  end


  def index
    @book = Book.new
    @books=Book.all
    @user = current_user
  end

  def show
   @book=Book.find(params[:id])
   @book_new = Book.new
   @user = @book.user
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user != current_user
       redirect_to  books_path
    end
  end

  def destroy
   @book=Book.find(params[:id])
   @book.destroy
   redirect_to books_path
  end
  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
