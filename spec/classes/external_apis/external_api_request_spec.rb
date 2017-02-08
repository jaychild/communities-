require 'rails_helper'

describe ExternalApi::Request do
  let(:request){ described_class }

  context 'when making a request to an external service' do
    describe '#make_request' do

      context 'passing a valid url' do
        let(:url){ 'https://maps.googleapis.com/maps/api/geocode/json?address=' }
        context 'with some data' do
          let(:data){ 'alton towers'}
          it 'should make request to external api' do
            expect(request.make_request(url, data)['status']).to eq('OK')
          end
        end

        context 'without data' do
          context 'passing a blank string' do
            let(:data){ '' }
            it 'should make request to external api' do
              expect(request.make_request(url, data)['status']).to eq('INVALID_REQUEST')
            end
          end

          context 'passing nil' do
            let(:data){ nil }
            it 'should make request to external api' do
              expect(request.make_request(url, data)['status']).to eq('INVALID_REQUEST')
            end
          end
        end
      end

      context 'passing an invalid url' do
        let(:url){ 'https://api.doesnot/exist/json?address=' }
        let(:data){ '' }
        it 'should try and make request' do
          expect{request.make_request(url, data)}.to raise_error(RuntimeError)
        end
      end
    end
  end
end