class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true

  before_create { change_date }

  def change_date
    self.review_date = review_date.next_day(3) 
  end
end
