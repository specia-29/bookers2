class UsersController < ApplicationController

  before_action :authenticate_user!
  #ログインしていない状態で他のページに遷移しようとした場合、ログインページに遷移する
  before_action :ensure_current_user, {only: [:edit,:update,:destroy]}
  #ログインユーザー以外の人の遷移を制限


  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.all
  end

  def new
    @user = User.new(user_params)
    if @user.save
      redirect_to  user_path(current_user.id)
    else
      render "users/sign_up"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user.id)
    else
      flash[:notice] = " errors prohibited this obj from being saved:"
        render :edit
    end

  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def  ensure_current_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
