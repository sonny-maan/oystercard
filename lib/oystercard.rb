class Oystercard
    MAX_BALANCE = 90
    MIN_BALANCE = 1
  attr_reader :balance
  attr_accessor :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
      fail "Maximum limit of £#{MAX_BALANCE} reached" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def deduct(fee)
    @balance -= fee
  end

  def in_journey?
      @in_use
  end

  def touch_in
    fail "Error, balance is lower than minimum" if balance < MIN_BALANCE
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

end
