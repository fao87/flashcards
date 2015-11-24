require 'rails_helper'
require 'spec_helper'

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

end

