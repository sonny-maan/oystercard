# frozen_string_literal: true

class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_JOURNEY_COST = 5

  attr_reader :balance
  attr_reader :entry_station
  attr_accessor :in_use

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise "Maximum limit of £#{MAX_BALANCE} reached" if max_bal?(amount)

    @balance += amount
  end

  def in_journey?
    entry_station
  end

  def touch_in(station)
    raise 'Error, balance is lower than minimum' if balance < MIN_BALANCE

    @in_use = true
    @entry_station = station
  end

  def touch_out
    deduct(MIN_JOURNEY_COST)
    @entry_station = nil
  end

  private

  def max_bal?(amount)
    (@balance + amount) > MAX_BALANCE
  end

  def deduct(fee)
    @balance -= fee
  end
end
