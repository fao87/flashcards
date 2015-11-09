class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true
  validate :original_and_translate_not_the_same
  before_create :set_default_review_date 

  scope :expired, -> { where("review_date <= ?", Date.today) }
  scope :random, -> { order("RANDOM()").take }

  def original_and_translate_not_the_same
    if original_text.mb_chars.downcase == translated_text.mb_chars.downcase
      errors.add(:original_text, 'совпадение недопустимо')
    end
  end

  def set_default_review_date
    self.review_date = review_date.next_day(3) 
  end

  def check_translation(text)
    if original_text.mb_chars.downcase == text.mb_chars.downcase
      self.review_date =  Date.today + 3.days
    else
      false
    end

  end   
  
end
