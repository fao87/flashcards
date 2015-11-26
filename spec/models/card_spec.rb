require 'rails_helper'

describe Card do
  it "should be invalid" do 
    card = Card.new(original_text: "mail")
    expect(card.check_translation("почтовый ящик")).to be false
  end

  it 'should add error if text are equal' do
    card = Card.new(original_text: 'car', translated_text: 'car')
    expect(card).not_to be_valid
  end

  it 'should be invalid' do
    card = Card.new(original_text: nil, translated_text: nil)
    expect(card).not_to be_valid
  end

  it 'should set review_date + 3' do
    card = Card.new
    card.save
    expect(card.review_date).to eq Date.today + 3
  end

  it 'should have review_date <= today when ready for review' do
    card = Card.create(original_text: 'buy buy', translated_text: 'пока пока', review_date: Date.today)
    expect(Card.expired.count).to eq 1
  end

  it 'check_translation words with different type оf letters' do
    card = Card.create(original_text: 'House', translated_text: 'ДоМ', review_date: Date.today)
    check_result = card.check_translation('HOUse')
    expect(check_result).to be true
  end

  it 'create card with empty original text' do
    card = Card.create(original_text: nil, translated_text: 'house', review_date: Date.today)
    expect(card).not_to be_valid
  end

  it 'create card with empty translated text' do
    card = Card.create(original_text: 'дом', translated_text: nil, review_date: Date.today)
    expect(card).not_to be_valid
  end
end

