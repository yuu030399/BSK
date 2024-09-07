class Public::ReviewsController < ApplicationController
  def index
    @user=current_user
    @reviews=Review.all
   @review=Review.new
  end
  
  

  def new
    @review=Review.new
   
  end

   
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "You have created review successfully."
      redirect_to review_path(@review)
    else
      @user = current_user
      @reviews = Review.all
      render :index
    end

  end



  def edit
      @review = Review.find(params[:id])
    
  end
    

  def update

    @review = Review.find(params[:id])
    @review.update(review_params)
     if  @review.save
         flash[:notice] = "You have updated review successfully.."
    redirect_to review_path
     else
      @user=current_user
     @reviews=Review.all
    render :edit
     end
  end

 def show

      @reviews=Review.all
      @review=Review.find(params[:id])
      @user=@review.user
      @comment = Comment.new
 end
 
   def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path

   end
  private

  def review_params
     params.require(:review).permit(:product_name, :amount, :category_id, :rate)
  end
   def is_matching_login_user
   review = Review.find(params[:id])
    unless review.user_id == current_user.id
      redirect_to reviews_path
    end
   end
end
