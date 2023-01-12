class CategoriesController < ApplicationController
  def index
    @categories = Category.all
   end
 
   
   def new
     @category = Category.new
     @brands = Brand.all
   end
 
   def create
     @category = Category.new(category_params)
     
     if @category.save
       respond_to do |format|
         format.turbo_stream { render 'index'}
       end
     else
       render :new
     end
   end
   
   private
 
     def category_params
       params.require(:category).permit(:name, :body)
     end
 
   end
  