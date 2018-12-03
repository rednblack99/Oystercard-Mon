class Oystercard
  attr_reader :balance
  attr_reader :in_journey
  attr_reader :entry_station

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise 'Max balance exceeded' if (amount + @balance) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(entry_station = "Aldgate East")
    raise 'Insufficient balance. GET RICH BRO!' if @balance < MIN_FARE
    raise 'User already in journey' if @in_journey == true
    @entry_station = entry_station
    @in_journey = true
  end

  def touch_out
    deduct
    @entry_station = nil
    @in_journey = false
  end

  private

  def deduct(amount = MIN_FARE)
    @balance -= amount
  end
end
