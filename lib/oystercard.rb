class Oystercard
    LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
      fail "Maximum limit of £#{LIMIT} reached" if (@balance + amount) > LIMIT
    @balance += amount
  end

  def deduct(fee)
    @balance -= fee
  end

end
