class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_review, only: [:destroy, :toggle_hidden]
    before_action :authorize!, only: [:edit, :update, :destroy]
   
  
    def create
      @idea = Idea.find(params[:idea_id])
      @review = Review.new review_params
      @review.idea = @idea
      @review.user = current_user
      if @review.save
        redirect_to @idea
      else
        @reviews = @idea.reviews.order(created_at: :desc)
        render root_path
      end
    end
  
    def destroy
        @review=Review.find params[:id]
        if can?(:curd,@review)
        @review.destroy
        redirect_to @review.idea
        else
            head :unauthorized
        end
    end
  
    
  
    private
  
    def review_params
      params.require(:review).permit( :body)
    end
  
    def find_review
      @review = Review.find params[:id]
    end
  
    
  
  end
  