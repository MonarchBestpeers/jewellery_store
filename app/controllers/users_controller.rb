class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @countries = CountryService.get_countries
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show_favorites
    @user = User.find(params[:id])
    @favorite_products = @user.favorited_products
  end

  private

  def user_params
    params.require(:user).permit(:email, :avatar, :password, :password_confirmation, :name, :age, :country)
  end
end
