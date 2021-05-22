class UsersController < ApplicationController
  def index
   @user = current_user
   @book = Book.new
   @users= User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
      flash[:notice]= 'You have created book successfully.'
    redirect_to books_path(@book.id)
   else
    @book_each=Book.all
    render action: :index
   end
   end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
       flash[:update]='You have updated user successfully.'
       redirect_to user_path(@user.id)
    else
       @user_each=Book.all
       render action: :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

end
