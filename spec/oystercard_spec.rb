require 'oystercard'


describe Oystercard do
    describe "#balance" do
      it { expect(subject.balance).to eq 0 }
    end

    describe '#top_up' do

      it 'can be top up' do
        expect{subject.top_up 10}.to change{subject.balance}.by(10)
      end

    end


    describe "#deduct" do
     it 'charge for the trip' do
      expect{subject.deduct 2}.to change{subject.balance}.by (-2)
     end
    end
    
    describe "#in_journey?" do
        it "determines if the card has been touched in, but not touched out yet (in journey)" do
            expect(subject).should_not be_in_journey
        end
    end
    
end
