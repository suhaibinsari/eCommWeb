class ProductsController < ApplicationController
  def index
   @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @brands = Brand.all
    @category = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save!
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

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  
  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_path, notice: "Product deleted successfully"

  end

  
  private

    def product_params
      params.require(:product).permit(:title, :description, :price, :category_id, :brand_id, :cart_id, :product_imgs_id)
    end

  end
  