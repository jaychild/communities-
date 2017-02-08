require 'rails_helper'

describe ExternalApi::GoogleService do
  let(:services){ described_class }

  context 'when retrieving google api information' do
    describe '#geo_code_url' do
      let(:url){ 'https://maps.googleapis.com/maps/api/geocode/json?address=' }
      it 'should specify lookup key for geocoding api' do
        expect(services::GEO_KEY).to eq('geo_loc')
      end

      it 'should return the URL from lookup' do
        expect(services.geo_code_url).to eq(url)
      end
    end
  end
end