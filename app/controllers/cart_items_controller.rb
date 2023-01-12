class CartItemsController < ApplicationController
  def index
    @cartItems = CartItem.all
   end
 
   
   def new 
     @cartItem = CartItem.new
     @brands = Brand.all
   end
 
   def create
     @cartItem = CartItem.new(cart_item_params)
     if @cartItem.save

       respond_to do |format|
         format.turbo_stream { render 'index'}
       end
     else
       render :new
     end
   end
   
   private
 
     def cart_item_params
       params.require(:cart_item).permit(:quantity)
     end

end
