class UsersController < ApplicationController
  #  remembeer to use before_filter :authorize for any controllers that need to be secured


  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
        # redirect_to '/'
         flash[:alert] =  "#{@user.first_name} #{@user.last_name} created and logged in."
         redirect_to '/signup'
    else
                  # render plain: @user.errors.full_messages.third

      flash[:alert] = 'Something went wrong. Check your info.'
      @org = Org.new
      render 'users/new'
    end
  end

  # def index
  # end

  # def show
  # end

  # def edit
  # end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
