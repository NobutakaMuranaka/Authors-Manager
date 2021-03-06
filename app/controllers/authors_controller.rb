class AuthorsController < ApplicationController
  before_action :logged_in_admin_user, only: [:index, :new, :show, :edit, :update]
  before_action :correct_admin_user,   only: [:edit, :update]

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end
  
  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "登録が完了しました"
      redirect_to @author
    else
      render 'new'
    end
  end
  
  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(author_params_update)
      flash[:success] = "プロフィールが更新されました！"
      redirect_to @author
    else
      render 'edit'
    end
  end

  private

    def author_params
      params.require(:author).permit(:name, :email, :introduction)
    end
    
    def author_params_update
      params.require(:author_params).permit(:name, :email, :introduction, :sex)
    end
end
