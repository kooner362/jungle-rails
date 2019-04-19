class ReviewsController < ApplicationController
    before_filter :current_user

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

    def destroy
        @product = Product.find(params[:product_id])
        puts @product.inspect
        @review = @product.reviews.find(params[:id])
        @review.destroy
        redirect_to product_path(@product)
    end
     
    private
    def review_params
        params.require(:review).permit(:description, :rating, :product_id)
    end
end
