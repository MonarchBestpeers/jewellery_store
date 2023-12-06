class UsersController < ApplicationController
  before_action :authenticate_user!

  def show_favorites
    @user = User.find(params[:id])
    @favorite_products = @user.favorited_products
  end
end