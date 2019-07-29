class Oystercard
    LIMIT = 90
  attr_reader :balance
  attr_accessor :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
      fail "Maximum limit of £#{LIMIT} reached" if (@balance + amount) > LIMIT
    @balance += amount
  end

  def deduct(fee)
    @balance -= fee
  end
  
  def in_journey?
      false
  end

end
