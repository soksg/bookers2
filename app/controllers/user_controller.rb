class UserController < ApplicationController
  def show
  end

  def edit
  end
  
  private
  
  def book_params
    params.require(:book).permit(:name, )    
  end
end
