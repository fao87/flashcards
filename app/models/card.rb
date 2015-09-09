class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true
  validate :original_and_translate_not_the_same
 
  def original_and_translate_not_the_same
    if original_text.mb_chars.downcase == translated_text.mb_chars.downcase
      errors.add(:original_text, 'совпадение недопустимо')
    end
  end

  before_create { change_date }

  def change_date
    self.review_date = review_date.next_day(3) 
  end
end
