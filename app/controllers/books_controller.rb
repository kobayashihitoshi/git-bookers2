class BooksController < ApplicationController
  
  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created the book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user.id = current_user.id
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to "/books"
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
