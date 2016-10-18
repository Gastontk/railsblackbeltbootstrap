class SessionsController < ApplicationController
  def new
    # @session = Session.new
  end

  def create
    # render plain: params
  	@user = User.find_by_email(params[:session][:email])
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:session][:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      flash[:alert] = "Welcome #{@user.first_name.capitalize} #{@user.last_name.capitalize}!!"

      redirect_to '/main'
    else
      # If user's login doesn't work, send them back to the login form.
      # render plain: "Failure here"
      flash[:log_alert] = "Incorrect login info. Please check your user name and password."

      redirect_to '/signup'
      # render plain: @user.errors.first
    end
  end

  def destroy
  	flash[:alert] =' You have been successfully logged out.'
  	session[:user_id] = nil
  	redirect_to '/signup'

  end
end
