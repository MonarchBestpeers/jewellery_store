class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :favorite, :unfavorite]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by_id(params[:id])

    if @product
      @product
    else
      render file: "#{Rails.root}/public/404.html", layout: false
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save && product_params[:price].to_i >= 0
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
        format.json { head :no_content }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find_by_id(params[:id])
  end

  def update
    @product = Product.find_by_id(params[:id])

    if @product.update(product_params) && product_params[:price].to_i >= 0
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      end
    else
      render file: "#{Rails.root}/public/422.html", layout: false
    end
  end

  def destroy
    @product = Product.find_by_id(params[:id])
    if @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def favorite
    @product = Product.find(params[:id])
    current_user.favorited_products << @product unless current_user.favorited_products.include?(@product)
    # redirect_to show_favorites_user_path(current_user.id), notice: 'Product added to favorites.'
    redirect_to products_path, notice: 'Product added to favorites.'
  end

  def unfavorite
    @product = Product.find(params[:id])
    current_user.favorited_products.delete(@product)
    # redirect_to @product, notice: 'Product removed from favorites.'
    redirect_to products_path, notice: 'Product removed from favorites.'
  end

  def search
    @products = Product.where('name like ?', "%#{params[:query]}%")

    render :search
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :material, :quantity_available)
  end
end
