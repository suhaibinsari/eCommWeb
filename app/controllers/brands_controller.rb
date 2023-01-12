class BrandsController < ApplicationController
  def index
    @brands = Brand.all
   end
 
   
   def new
     @Brand = Brand.new
     @brands = Brand.all
   end
 
   def create
     @Brand = Brand.new(brand_params)
     
     if @Brand.save
       respond_to do |format|
         format.turbo_stream { render 'index'}
       end
     else
       render :new
     end
   end
   
   private
 
     def brand_params
       params.require(:brand).permit(:name, :body)
     end
  end
  