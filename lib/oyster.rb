class Oystercard
  attr_reader :balance
  attr_reader :in_journey

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

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise 'Insufficient balance. GET RICH BRO!' if @balance < MIN_FARE
    raise 'User already in journey' if @in_journey == true
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
