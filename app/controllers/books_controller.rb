class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def index
  end

  def show
  end

  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :image)    
  end
end
