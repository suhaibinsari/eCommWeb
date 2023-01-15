class CategoriesController < ApplicationController
  def index
    @categories = Category.all
   end
   
  def show
    @category = Category.find(params[:id])

  end
  
  def new
     @category = Category.new
  end
 
  def create
    @category = Category.new(category_params)
    # @category.user = current_user
      if @category.save!
        redirect_to categories_path
     else
       render :new
     end
  end
   
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  
  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path, notice: "Category deleted successfully"
  end

   private
 
     def category_params
       params.require(:category).permit(:name, :body)
     end
 
   end
  