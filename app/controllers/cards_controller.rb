class CardsController < ApplicationController
  before_action :find_card, only: [:update, :show, :edit, :destroy]

  def index
    @cards = Card.all
  end

  def show  
  end
    
  def new
    @card = Card.new
  end

  def create
    @card = Card.create(card_params)
    redirect_to @card
  end

  def edit
  end
  
  def update
    if @card.update(card_params)
      redirect_to @card
    else
      render 'edit'
    end
  end
  
  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private

    def find_card
      @card = Card.find(params[:id])   
    end

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end

end
