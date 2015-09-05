class CardsController < ApplicationController
<<<<<<< HEAD
	def index
		@cards = Card.all
	end

	def show
		@card = Card.find(params[:id])
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def find_card
	end

	def card_params
	end
=======
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

>>>>>>> 868f6b08842706c058f4ab71dbc2eb1d03af651f
end
