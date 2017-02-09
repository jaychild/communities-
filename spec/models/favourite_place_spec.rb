require 'rails_helper'

RSpec.describe FavouritePlace do
  context 'creating a favorite place' do
    context 'validations' do
      context 'name is missing' do
        let(:favorite_place){ described_class.new(
            name: '', address_line: 'test', country: 'test', region: 'test', post_code: 'test'
        )}
        it 'should not be valid' do
          expect(favorite_place.valid?).to be_falsey
        end
      end

      context 'address is missing' do
        let(:favorite_place){ described_class.new(
            name: 'test', address_line: '', country: 'test', region: 'test', post_code: 'test'
        )}
        it 'should not be valid' do
          expect(favorite_place.valid?).to be_falsey
        end
      end

      context 'country is missing' do
        let(:favorite_place){ described_class.new(
            name: 'test', address_line: 'test', country: '', region: 'test', post_code: 'test'
        )}
        it 'should not be valid' do
          expect(favorite_place.valid?).to be_falsey
        end
      end

      context 'region is missing' do
        let(:favorite_place){ described_class.new(
            name: 'test', address_line: 'test', country: 'test', region: '', post_code: 'test'
        )}
        it 'should not be valid' do
          expect(favorite_place.valid?).to be_falsey
        end
      end

      context 'post code is missing' do
        let(:favorite_place){ described_class.new(
            name: 'test', address_line: 'test', country: 'test', region: 'test', post_code: ''
        )}
        it 'should not be valid' do
          expect(favorite_place.valid?).to be_falsey
        end
      end

      context 'all fields are present' do
        let(:favorite_place){ described_class.new(
            name: 'test', address_line: 'test', country: 'test', region: 'test', post_code: 'test'
        )}
        it 'should not be valid' do
          expect(favorite_place.valid?).to be_truthy
        end
      end
    end
  end
end
