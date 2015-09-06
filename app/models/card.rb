class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true

  before_create { self.review_date = review_date.next_day(3) }

  #def change_date
   # review_date.next_day(3)
  #end
 
end
