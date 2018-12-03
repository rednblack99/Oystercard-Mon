require 'oyster'

RSpec.describe Oystercard do
  it 'should return a balance of 0 when initialized' do
    expect(subject.balance).to eq 0
  end

  it 'should top up the card by the amount given' do
    expect(subject.top_up(5)).to eq 5
  end

  it 'should raise an error if user tries to top up beyond maximum limit' do
    expect{ subject.top_up(::MAX_BALANCE + 1) }.to raise_error {"Maximum balance exceeded"}
  end

  it 'should deduct an amount from the card' do
    subject.top_up(20)
    expect(subject.deduct(5)).to eq 15
  end

end
