class CommentsController < ApplicationController
    def create
        @user = current_user
        @product = Product.find(params[:comment][:product_id])

        @comment = @product.comments.create(comment_params)
        if @comment.save!
            redirect_to product_path(@product)    
            else
            render :new
          end
      end

      def destroy

        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to product_path(@comment.product), status: :see_other
      end


    
      private
        def comment_params
          params.require(:comment).permit(:description, :product_id, :status).merge(user_id: current_user.id)
        end
end



