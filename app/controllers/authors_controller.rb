class AuthorsController < ApplicationController
  def index
  end

  def show
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
end
