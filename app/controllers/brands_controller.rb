class BrandsController < ApplicationController
  
  def index
    @brands = Brand.all
   end
   
  def show
    @brand = Brand.find(params[:id])

  end
  
  def new
     @brand = Brand.new
  end
 
  def create
    @brand = Brand.new(
      name: params[:brand][:name], 
      body: params[:brand][:body]
    )
    # @category.user = current_user
      if @brand.save!
        redirect_to brands_path
     else
       render :new
     end
  end
   
  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])

    if @brand.update(brand_params)
      redirect_to @brand
    else
      render :edit, status: :unprocessable_entity
    end
  end

  
  def destroy
    Brand.find(params[:id]).destroy
    redirect_to brands_path, notice: "Brand deleted successfully"
  end

   private
 
  #  def brand_params
  #   params.require(:brand).permit(:name, :body)
  # end
     
end