require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  # Authentication test suite
  describe 'POST /auth/login' do
    # create test auth
    let!(:auth) { create(:auth) }
    # set test valid and invalid credentials
    let(:valid_credentials) do
      {
        username: auth.username,
        password: auth.password
      }
    end

    let(:invalid_credentials) do
      {
        username: Faker::Internet.email,
        password: Faker::Internet.password
      }
    end

    # returns auth token when request is valid
    context 'When request is valid' do
      before { post '/auth/login', params: valid_credentials }

      it 'returns an authentication token' do
        expect(json['token']).not_to be_nil
      end
    end

    # returns failure message when request is invalid
    context 'When request is invalid' do
      before { post '/auth/login', params: invalid_credentials }

      it 'returns a failure message' do
        expect(json['message']).to match(/There was an error logging in. Please try again./)
      end
    end
  end

  describe 'POST /auth/refresh_token' do
    # create test auth
    let!(:auth) { create(:auth) }
    # set test valid and invalid credentials
    let(:valid_credentials) do
      {
        username: auth.username,
        password: auth.password
      }
    end

    before(:each) do
      post '/auth/login', params: valid_credentials
    end

    let(:valid_token) { "#{json['token']['token_type']} #{json['token']['access_token']}" }

    let(:valid_refresh_params) do
      {
        refresh_token: json['token']['refresh_token']
      }
    end

    let(:invalid_refresh_params) do
      {
        refresh_token: ''
      }
    end

    let(:valid_header) do
      {
        Authorization: valid_token
      }
    end

    let(:invalid_header) do
      {
        Authorization: ''
      }
    end

    # returns auth token when request is valid
    context 'When request is valid' do
      before { post '/auth/refresh', params: valid_refresh_params, headers: valid_header }

      it 'returns an authentication token' do
        expect(json['token']).not_to be_nil
      end
    end

    # returns failure message when request param is invalid
    context 'When request param is invalid' do
      before { post '/auth/refresh', params: invalid_refresh_params, headers: valid_header }

      it 'returns a failure message' do
        expect(json['message']).to match(/There was an error logging in. Please try again./)
      end
    end

    # returns failure message when request header is invalid
    context 'When request header is blank' do
      before { post '/auth/refresh', params: valid_refresh_params, headers: invalid_header }

      it 'returns a failure message' do
        expect(json['message']).to match(/Missing token/)
      end
    end
  end

  describe 'POST /auth/logout' do
    # create test auth
    let!(:auth) { create(:auth) }
    # set test valid and invalid credentials
    let(:valid_credentials) do
      {
        username: auth.username,
        password: auth.password
      }
    end

    before(:each) do
      post '/auth/login', params: valid_credentials
    end

    let(:valid_token) { "#{json['token']['token_type']} #{json['token']['access_token']}" }

    let(:valid_logout_params) do
      {
        token: json['token']['access_token']
      }
    end

    let(:invalid_logout_params) do
      {
        token: ''
      }
    end

    let(:valid_header) do
      {
        Authorization: valid_token
      }
    end

    let(:invalid_header) do
      {
        Authorization: ''
      }
    end

    # returns auth token when request is valid
    context 'When request is valid' do
      before { post '/auth/logout', params: valid_logout_params, headers: valid_header }

      it 'returns a success message' do
        expect(json['message']).to match(/Token Successfully Revoked/)
      end
    end

    # returns failure message when request param is invalid
    context 'When request param is invalid' do
      before { post '/auth/logout', params: invalid_logout_params, headers: valid_header }

      it 'returns a failure message' do
        expect(json['message']).to match(/Unknown error/)
      end
    end

    # returns failure message when request header is invalid
    context 'When request header is blank' do
      before { post '/auth/logout', params: valid_logout_params, headers: invalid_header }

      it 'returns a failure message' do
        expect(json['message']).to match(/Missing token/)
      end
    end
  end
end
