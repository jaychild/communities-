require 'rails_helper'

describe GoogleService do
  let(:services){ described_class }

  context 'Googles geo location API service information' do
    it 'should return the geo_key' do
      expect(services::GEO_KEY).to eq('geo_loc')
    end

  end

end