require 'oyster'

RSpec.describe Oystercard do
  it 'should return a balance of 0 when initialized' do
    expect(subject.balance).to eq 0
  end
end
