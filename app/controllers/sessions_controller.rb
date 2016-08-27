class SessionsController < ApplicationController
  def new
  end

  def create
   #   binding.pry
     user = User.find_by(username: params[:user][:username])

     password = params[:user][:password]

     if user && user.authenticate(password)
        session[:user_id] = user.id
        redirect_to root_path, notice: "Logged in successfully"
     else
        redirect_to login_path, alert: "Invalid username/password"
     end


  end

  def destroy
     reset_session #clear session cookies
     redirect_to login_path, notice: "You have logged out"
  end
end
