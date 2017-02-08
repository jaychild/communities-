require 'rails_helper'

describe ExternalApi::GoogleServices::GeoLocationResponseTranslator do

  context 'location attribute checkers' do
    let(:translator){ described_class.new('') }
    describe '#region?' do
      context 'response hash with administrative_area_level_1' do
        it 'should return true' do
          expect(translator.send(:region?, 'administrative_area_level_1')).to eq(true)
        end
      end

      context 'response hash with administrative_area_level_2' do
        it 'should return true' do
          expect(translator.send(:region?, 'administrative_area_level_2')).to eq(true)
        end
      end

      context 'response hash without administrative_area_level_1 or administrative_area_level_2' do
        it 'should return false' do
          expect(translator.send(:region?, 'administrative_area_level_3')).to eq(false)
        end
      end
    end

    describe '#country' do
      context 'response hash with country' do
        it 'should return true' do
          expect(translator.send(:country?, 'country')).to eq(true)
        end
      end

      context 'response hash without country' do
        it 'should return false' do
          expect(translator.send(:country?, 'road')).to eq(false)
        end
      end
    end

    describe '#postal_code?' do
      context 'response hash with country' do
        it 'should return true' do
          expect(translator.send(:postal_code?, 'postal_code')).to eq(true)
        end
      end

      context 'response hash without country' do
        it 'should return false' do
          expect(translator.send(:postal_code?, 'route')).to eq(false)
        end
      end
    end

    describe '#addres?' do
      context 'is a postal_code' do
        it 'should return false' do
          expect(translator.send(:address?, 'postal_code')).to eq(false)
        end
      end

      context 'is a region' do
        it 'should return false' do
          expect(translator.send(:address?, 'administrative_area_level_1')).to eq(false)
        end
      end

      context 'country' do
        it 'should return false' do
          expect(translator.send(:address?, 'country')).to eq(false)
        end
      end

      context 'neither country, region or postal code' do
        it 'should return false' do
          expect(translator.send(:address?, 'route')).to eq(true)
        end
      end
    end

  end

  context 'response formatter' do
    describe '#format_response' do
      it 'translates API response into an object hash' do
        expect(translator.format_response).to eq(location_hash)
      end

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
      let(:translator){ described_class.new(successful_api_response)}
      let(:location_hash){
        {
            addr: 'Farley Ln, Alton, Stoke-on-Trent', addr_region: 'Staffordshire, England',
            addr_country: 'GB', addr_postal_code: 'ST10 4DB'
        }
      }
    end
  end
end