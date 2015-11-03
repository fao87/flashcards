class HomeController < ApplicationController
  def index
  	@card = Card.expired.random
  end
end
