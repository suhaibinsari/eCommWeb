class CartItemsController < ApplicationController
  
     def index
      @cartItems = CartItem.all
     end
   
     def show
       @cartItem = CartItem.find(params[:id])
     end
   
     def new
       @cartItem = CartItem.new
     end
   
     def create
       @cartItem = CartItem.new(cart_item_params)
       @cartItem.user = current_user
       puts cart_item_params
       if @cartItem.save!
         redirect_to products_path
       else
         render :new
       end
     end
   
   
     def edit
       @cartItem = CartItem.find(params[:id])
     end
   
     def update
       @cartItem = CartItem.find(params[:id])
   
       if @cartItem.update(cart_item_params)
         redirect_to @cartItem
       else
         render :edit, status: :unprocessable_entity
       end
     end
   
     
     def destroy
      CartItem.find(params[:id]).destroy
       puts "================#{params[:id]}====================="
       redirect_to cart_items_path, notice: "Product deleted successfully"
     end
   
     
     private
   
       def product_params
         params.require(:cart_items).permit(:quantity)
       end

end
