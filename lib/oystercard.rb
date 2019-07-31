# frozen_string_literal: true

class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_JOURNEY_COST = 5

  attr_reader :balance, :journeys, :in_journeys

  def initialize
    @balance = 0
    @journeys = {}
    @in_journey = false
    ##remember to initialize your start and end stations as nil
  end

  def top_up(amount)
    raise "Maximum limit of £#{MAX_BALANCE} reached" if max_bal?(amount)

    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    raise 'Error, balance is lower than minimum' if balance < MIN_BALANCE
    ##remember when you touch in you want to reset your exit station to nil for the next journey (reset to start fresh on new journey)
    @journeys.store(:entry_station, station)
    @in_journey = true
  end 

  def touch_out(station)
    deduct(MIN_JOURNEY_COST)
    @journeys.store(:exit_station, station)
    ##remember when you touch out you want to reset your entry station to nil for the next journey (reset to start fresh on new journey)
    @in_journey = false
  end

  private

  def max_bal?(amount)
    (@balance + amount) > MAX_BALANCE
  end

  def deduct(fee)
    @balance -= fee
  end
end
