class ReviewsController < ApplicationController

  expose(:review)
  expose(:product)

  def edit
  end

  def create
    unless current_user == nil
      self.review = Review.new(review_params)
      self.review.user = current_user
      if review.save
        product.reviews << review
        redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
      else
        render action: 'new'
      end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
