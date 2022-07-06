class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create 
    @product = Product.new(products_params)

    if (@product.save)

      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(products_params)
      redirect_to products_path
    else 
      render :update
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to product_path
  end

  private
  def products_params
    params.require(:product).permit(:name, :contents, :description, :image, :price, :category_id)
  end

end
