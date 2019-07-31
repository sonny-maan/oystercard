# frozen_string_literal: true

class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_JOURNEY_COST = 5

  attr_reader :balance, :entry_station, :journeys, :exit_station

  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = {}
    @exit_station = nil
  end

  def top_up(amount)
    raise "Maximum limit of £#{MAX_BALANCE} reached" if max_bal?(amount)

    @balance += amount
  end

  def in_journey?
    entry_station
  end

  def touch_in(entry_station)
    raise 'Error, balance is lower than minimum' if balance < MIN_BALANCE
    @exit_station = nil
    @entry_station = entry_station
    @journeys.store(:entry_station, entry_station)
  end

  def touch_out(exit_station)
    deduct(MIN_JOURNEY_COST)
    @exit_station = exit_station
    @journeys.store(:exit_station, exit_station)
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
