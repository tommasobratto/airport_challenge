require 'airplane'

describe Airplane do

  let(:airplane) { Airplane.new    }
  let(:airport)  { double :airport }

  context 'airplane status' do
    
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