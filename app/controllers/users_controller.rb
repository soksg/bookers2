class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:top]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users=User.all
    @user=current_user
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if  @book.save
        redirect_to book_path(@book), notice: 'You have created book successfully.'
    else
      render :index
    end
  end

  def show
    @user=User.find(params[:id])
    @books=@user.books
    @book=Book.new
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(current_user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

   def correct_user
    @user = User.find(params[:id])
    @book = @user.books
      unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
