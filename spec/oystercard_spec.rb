require 'oystercard'


describe Oystercard do
    
    describe " #balance" do
      it { expect(subject.balance).to eq 0 }
    end

    describe ' #top_up' do
      it 'can be top up' do
        expect{subject.top_up 10}.to change{subject.balance}.by(10)
      end
      it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error "Maximum limit of £#{maximum_balance} reached"
      end
    end


    describe " #deduct" do
     it 'charge for the trip' do
      expect{subject.deduct 2}.to change{subject.balance}.by (-2)
     end
    end

    describe " #in_journey?" do
        it "determines if the card has been touched in, but not touched out yet (in journey)" do
            expect(subject).not_to be_in_journey
        end
    end

    describe " #touch_in" do
        it "can touch in" do
          subject.touch_in
          expect(subject).to be_in_journey
        end
    end

    describe " #touch_out" do
        it "changes @in_use to false indicate the card is not on a journey" do
            subject.touch_out
            expect(subject).not_to be_in_journey
        end
    end
    

    end

