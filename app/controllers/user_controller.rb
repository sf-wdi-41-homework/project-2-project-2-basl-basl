class UserController < ApplicationController

  def index

  end
  def new

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

    private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
