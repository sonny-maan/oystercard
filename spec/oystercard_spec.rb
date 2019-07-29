require 'oystercard'

# expect{Counter.increment}.to change{Counter.count}.by(2)

describe Oystercard do
    describe "#balance" do
      it { expect(subject.balance).to eq 0 }
    end

    describe '#top_up' do

      it 'can be top up' do
        expect{subject.top_up 10}.to change{subject.balance}.by(10)
      end

    end
end
