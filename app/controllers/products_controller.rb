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
  end

  private
  def products_params
    params.require(:product).permit(:name, :contents, :description, :image, :price, :category_id)
  end

end
