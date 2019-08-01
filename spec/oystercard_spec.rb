# frozen_string_literal: true

require 'oystercard'

describe Oystercard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:station) { double :station }
  describe ' #balance' do
    it { expect(subject.balance).to eq 0 }
  end

  describe ' #top_up' do
##
    it 'can be top up' do
      expect { subject.top_up 10 }.to change { subject.balance }.by(10)
    end
    
    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "Maximum limit of £#{maximum_balance} reached"
    end
  end
##
  describe ' #in_journey?' do
    
    it 'determines if the card has been touched in, but not touched out yet (in journey)' do
      expect(subject).not_to be_in_journey
    end
    
  end
##
  describe ' #touch_in' do
    
    it 'can occur' do
      subject.top_up(5)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to be true
    end
##
    it 'will not touch in if below minimum balance' do
      expect { subject.touch_in(entry_station) }.to raise_error 'Error, balance is lower than minimum'
    end
    
  end
##
  describe ' #touch_out' do
    
    it 'deduct minimun jorney cost from balance when touch out' do
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MIN_JOURNEY_COST)
    end
    
  end
##
  describe 'journey' do
    let(:journey) { { entry_station: entry_station, exit_station: exit_station } }
    it 'stores a journey' do
      allow(subject).to receive(:balance) { 5 }
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end
  end
end
