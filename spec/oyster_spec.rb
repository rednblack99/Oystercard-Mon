require 'oyster'

RSpec.describe Oystercard do
  it 'should return a balance of 0 when initialized' do
    expect(subject.balance).to eq 0
  end

  it 'should top up the card by the amount given' do
    expect(subject.top_up(5)).to eq 5
  end

  it 'should raise an error if user tries to top up beyond maximum limit' do
    expect { subject.top_up(::MAX_BALANCE + 1) }.to raise_error { 'Maximum balance exceeded' }
  end

  it 'should deduct an amount from the card' do
    subject.top_up(20)
    expect(subject.deduct(5)).to eq 15
  end

  describe '#touch_in' do
    it 'should set status to in journey when the user touches in' do
      expect(subject.touch_in).to eq true
    end
  end

  describe '#touch_out' do
    it 'should set status to not in journey when the user touches out' do
      subject.touch_in
      expect(subject.touch_out).to eq false
    end
  end

  it 'when initialized card starts not in journey' do
    expect(subject.in_journey).to eq false
  end
end
