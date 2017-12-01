class UserController < ApplicationController

  def index
  end

  def new
  end
  def show
    @user = User.find(params[:id])

  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/search'
    else
      redirect_to '/user/new'
    end
  end
  def edit
    @user = current_user
  end

  def update
    @user= User.find(current_user.id)
    userInfo=user_params
    if @user.update(userInfo)
      redirect_to '/profile'
    else
      render(edit)
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
