class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart || current_user.create_cart
    @cart_items = @cart.cart_items
  end

  def add_to_cart
    @product = Product.find(params[:product_id])

    # Ensure the user has a cart, create one if not
    @cart = current_user.cart || current_user.create_cart

    # Check if the product is already in the cart
    unless @cart.products.include?(@product)
      @cart.products << @product
      flash[:notice] = 'Product added to cart!'
    else
      flash[:alert] = 'Product is already in the cart.'
    end

    redirect_to root_path
  end

  def remove_from_cart
    @product = Product.find(params[:product_id])
    @cart = current_user.cart

    if @cart && @cart.products.include?(@product)
      @cart.products.delete(@product)
      flash[:notice] = 'Product removed from cart!'
    else
      flash[:alert] = 'Product is not in the cart.'
    end

    redirect_to root_path
  end
end
