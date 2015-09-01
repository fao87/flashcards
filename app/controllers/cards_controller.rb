class CardsController < ApplicationController
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
end
