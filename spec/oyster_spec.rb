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

  describe '#touch_in' do
    it 'should set status to in journey when the user touches in' do
      subject.top_up(20)
      expect(subject.touch_in).to eq true
    end

    it 'should not let user touch in without sufficient balance' do
      expect { subject.touch_in }.to raise_error 'Insufficient balance. GET RICH BRO!'
    end

    it 'should raise error if user tries to touch in twice' do
      subject.top_up(20)
      subject.touch_in
      expect { subject.touch_in }.to raise_error 'User already in journey'
    end
  end

  it 'should remember entry station after touch in' do
    subject.top_up(20)
    subject.touch_in("Aldgate East")
    expect(subject.entry_station).to eq "Aldgate East" 
  end

  describe '#touch_out' do
    it 'should set status to not in journey when the user touches out' do
      subject.top_up(20)
      subject.touch_in
      expect(subject.touch_out).to eq false
    end

    it 'should reduce the balance by the minimum fare' do
      subject.top_up(20)
      subject.touch_in
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
    end

    it 'should set entry station to nil upon touch out' do
      subject.top_up(20)
      subject.touch_in
      subject.touch_out
      expect(subject.entry_station).to be nil
    end
  end

  it 'when initialized card starts not in journey' do
    expect(subject.in_journey).to eq false
  end
end
