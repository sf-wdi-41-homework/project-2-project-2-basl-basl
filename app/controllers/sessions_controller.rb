class SessionsController < ApplicationController


    def create
      user = User.find(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/search'
      else
        redirect_to '/sessions/new'
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to '/'
    end
end
