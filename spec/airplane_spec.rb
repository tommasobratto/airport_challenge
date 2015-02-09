require 'airplane'

describe Airplane do

  let(:airplane) { Airplane.new    }
  let(:airport)  { double :airport }

  context 'airplane status' do

    # It needs a way to change the plane's status in the 'airport.allow-...' methods,
    # or we need to change the plane's behaviour (it's the plane that lands and takes off after all)

    it 'should be flying after take off' do  
      airplane.flying!
      expect(airplane.flying?).to eq true
    end

    it 'should be taxing after landing' do
      airplane.taxing!
      expect(airplane.flying?).to eq false
    end
  end
end