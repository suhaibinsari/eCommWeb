class CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all
   end
 
   def show
     @cartItem = CartItem.find(params[:id])
   end
 
   def new
     @cartItem = CartItem.new
     @brands = Brand.all
     @category = Category.all
     @comment = Comment.all
   end
 
   def create
     @cartItem = CartItem.new(cartItem_params)
     @product.user = current_user
     # @product.save!
 
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
 
     if @product.update(cartItem_params)
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
 
     def cartItem_params
       params.require(:cartItem).permit(:quantity, :cart_id)
     end
 

end
