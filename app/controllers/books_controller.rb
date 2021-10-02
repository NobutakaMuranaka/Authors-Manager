class BooksController < ApplicationController
  before_action :logged_in_admin_user, only: [:index, :new, :show, :edit, :update]
  before_action :correct_admin_user,   only: [:edit, :update]

  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "登録が完了しました"
      redirect_to @book
    else
      render 'new'
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params_update)
      flash[:success] = "プロフィールが更新されました！"
      redirect_to @book
    else
      render 'edit'
    end
  end
  
  private

    def book_params
      params.require(:book).permit(:title)
    end
    
    def book_params_update
      params.require(:book).permit(:title)
    end
end
