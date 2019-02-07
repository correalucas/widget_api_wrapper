require 'rails_helper'

RSpec.describe AuthenticateUser do
  # valid request subject
  subject(:valid_auth_obj) { described_class.new('michael@showoff.ie', 'password') }
  # invalid request subject
  subject(:invalid_auth_obj) { described_class.new('foo', 'bar') }

  # Test suite for AuthenticateUser#call
  describe '#call' do
    # return token when valid request
    context 'when valid credentials' do
      it 'returns a token json' do
        token = valid_auth_obj.call
        expect(token).not_to be_nil
      end
    end

    # raise Authentication Error when invalid request
    context 'when invalid credentials' do
      it 'raises an authentication error' do
        expect { invalid_auth_obj.call }
          .to raise_error(
            Flexirest::HTTPClientException,
            /There was an error logging in. Please try again./
          )
      end
    end
  end
end
