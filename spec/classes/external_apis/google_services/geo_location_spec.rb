require 'rails_helper'

describe ExternalApi::GoogleServices::GeoLocation do
  let(:geo_location){ described_class }
  describe '#get_location_details' do
    context 'searching for a location' do
      context 'successfully replies with the location address and geo location ' do
        let(:location){ 'alton towers'}
        before(:each){ expect(geo_location).to receive(:make_request).and_return(successful_api_response)}

        it 'should return translated api response' do
          expect(geo_location.get_location_details(location)).to eq(location_hash)
        end
      end

      context 'rails to return location details' do
        let(:location){ 'alton towers'}
        before(:each){ expect(geo_location).to receive(:make_request).and_return(failed_api_response)}

        it 'should return translated api response' do
          expect(geo_location.get_location_details(location)).to eq(safe_hash)
        end
      end

    end
  end

  describe '#construct_location_parts' do
    context 'pass arguments array containing one location part' do
      let(:location_array){ ['alton towers'] }
      it 'should return single location string' do
        expect(geo_location.construct_location_string(location_array)).to eq('alton towers')
      end
    end

    context 'pass arguments array containing multiple location parts' do
      let(:location_array){ ['alton', 'towers']}
      it 'should return a string of elements joined together with a +' do
        expect(geo_location.construct_location_string(location_array)).to eq('alton+towers')
      end
    end
  end

  let(:failed_api_response){
    {
        'results' =>[
            'a whole bunch of errors'
        ],
        'status' => 'Not OK'
    }
  }

  let(:successful_api_response){
    {
        'results'=>[
            {'address_components'=>[
                {'long_name'=>'Farley Lane', 'short_name'=>'Farley Ln', 'types'=>[
                    'route'
                ]},
                {'long_name'=>'Alton', 'short_name'=>'Alton', 'types'=>[
                    'locality', 'political'
                ]},
                {'long_name'=>'Stoke-on-Trent', 'short_name'=>'Stoke-on-Trent', 'types'=>[
                    'postal_town'
                ]},
                {'long_name'=>'Staffordshire', 'short_name'=>'Staffordshire', 'types'=>[
                    'administrative_area_level_2', 'political'
                ]},
                {'long_name'=>'England', 'short_name'=>'England', 'types'=>[
                    'administrative_area_level_1', 'political']
                },
                {'long_name'=>'United Kingdom', 'short_name'=>'GB', 'types'=>[
                    'country', 'political'
                ]},
                {'long_name'=>'ST10 4DB', 'short_name'=>'ST10 4DB', 'types'=>[
                    'postal_code'
                ]}
            ],
             'formatted_address'=>'Farley Ln, Alton, Stoke-on-Trent ST10 4DB, UK', 'geometry'=>{
                'location'=>{
                    'lat'=>52.9874366, 'lng'=>-1.8864512
                },
                'location_type'=>'APPROXIMATE', 'viewport'=>{
                    'northeast'=>{
                        'lat'=>52.98878558029149, 'lng'=>-1.885102219708498
                    },
                    'southwest'=>{
                        'lat'=>52.98608761970849, 'lng'=>-1.887800180291502
                    }
                }
            },
             'place_id'=>'ChIJlbIENWEWekgRvIvaFccPCb4', 'types'=>[
                'amusement_park', 'establishment', 'point_of_interest'
            ]}
        ],
        'status'=>'OK'
    }
  }

  let(:location_hash){
    {
        addr: 'Farley Ln, Alton, Stoke-on-Trent', addr_region: 'Staffordshire, England',
        addr_country: 'GB', addr_postal_code: 'ST10 4DB'
    }
  }

  let(:safe_hash){
    {status: 'Not OK'}
  }
end