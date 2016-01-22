class UsersController < ApplicationController
  def new
    @user = User.new
    render layout: false
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/", success: 'Successfully logged in!'
    else
      flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      render 'new', layout: false
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
