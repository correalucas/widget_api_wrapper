require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  # create test auth
  let(:headers) { { 'Authorization' => 'Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024' } }
  let(:invalid_headers) { { 'Authorization' => nil } }

  describe '#authorize_request' do
    context 'when auth token is passed' do
      before { allow(request).to receive(:headers).and_return(headers) }

      # private method authorize_request returns current user token
      it 'sets the current user token' do
        expect(subject.instance_eval { authorize_request }).to eq(headers['Authorization'])
      end
    end

    context 'when auth token is not passed' do
      before do
        allow(request).to receive(:headers).and_return(invalid_headers)
      end

      it 'raises MissingToken error' do
        expect { subject.instance_eval { authorize_request } }.
          to raise_error(ExceptionHandler::MissingToken, /Missing token/)
      end
    end
  end
end
