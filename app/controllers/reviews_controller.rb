class ReviewsController < ApplicationController
	before_action :authenticate_user!
    
   def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = "Review created!"
      redirect_to root_url
   end
end

   def destroy
   end

def upvote 
  @review = Review.find(params[:id])
  @review.upvotes.create
 # render 'static_pages/home'
 # @reviews=current_user.reviews
  redirect_to :back
end
   private

def review_params
    params.require(:review).permit(:content,:rest_name)
  end
end