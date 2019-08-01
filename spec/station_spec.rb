# frozen_string_literal: true
require 'station'
describe Station do
subject(:station){ described_class.new(name: "Old Street" , zone: 1)}

it "knows its name (the station)" do
    expect(subject.name).to eq "Old Street"
end

it "knows what zone it is in" do
    expect(subject.zone).to eq (1)
end

end
