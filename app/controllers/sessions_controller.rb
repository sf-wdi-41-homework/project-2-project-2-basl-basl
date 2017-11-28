class SessionsController < ApplicationController


    def create
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/sessions/new'
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to '/sessions/new'
    end
end
