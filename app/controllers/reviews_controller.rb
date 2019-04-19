class ReviewsController < ApplicationController
    def create
        @product = Product.find(params[:product_id])
        new_review ={
            description: review_params[:description],
            rating: review_params[:rating],
            user_id: current_user.id,
            product_id: review_params[:product_id]
        }
        @review = @product.reviews.create(new_review)
        redirect_to product_path(@product)
    end
     
    private
    def review_params
        params.require(:review).permit(:description, :rating, :product_id)
    end
end
