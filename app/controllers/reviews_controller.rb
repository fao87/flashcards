class ReviewsController < ApplicationController
  def new
  	if params[:card_id]
       @card = Card.find(params[:card_id])
    else
       @card = Card.expired.random
    end
  end

  def create
    @card = Card.find(review_params[:card_id])
    if @card.check_translation(params[:text])
      flash[:success] = 'Правильно, следующая карточка: '
      redirect_to new_review_url  
    else
      flash[:error] = 'Перевод неверный, попробуйте еще раз:' 
      redirect_to new_review_url(card_id: @card.id)
    end
  end

  private

  def review_params
    params.require(:review).permit(:card_id, :original_text)
  end

   
  
end
