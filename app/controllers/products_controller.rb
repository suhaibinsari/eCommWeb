class ProductsController < ApplicationController
  def index
   @products = Product.all
  end

  
  def new
    @product = Product.new
    @brands = Brand.all
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      respond_to do |format|
        format.turbo_stream { render 'index'}
      end
    else
      render :new
    end
  end
  
  private

    def product_params
      params.require(:product).permit(:title, :description, :price)
    end

  end
  