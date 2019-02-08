require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let!(:auth) { create(:auth) }

  before(:all) do
    @user_attr = attributes_for(:user)
    post('/signup', params: { user: @user_attr })
    @sign_up_json = json
  end

  let(:user_id) { @sign_up_json['user']['id'] }

  let(:valid_credentials) do
    {
      username: @user_attr[:email],
      password: @user_attr[:password]
    }
  end

  let(:password_credentials) do
    {
      user: {
        current_password: @user_attr[:password],
        new_password: @user_attr[:password]
      }
    }
  end

  let(:valid_token) {"#{@sign_up_json['token']['token_type']} #{@sign_up_json['token']['access_token']}" }

  let(:valid_header) do
    {
      Authorization: valid_token
    }
  end

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json).not_to be_nil
      end

      it 'returns an authentication token' do
        expect(json['token']['access_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {user: {}} }

      it 'does not create a new user' do
        expect(response).to have_http_status(400)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Unfortunately you need to supply the parameter 'user' to continue/)
      end
    end
  end

  # Users profile test suite
  describe 'GET /my_profile' do
    context 'when valid request' do
      before { get '/my_profile', headers: valid_header }

      it 'returns success code' do
        expect(response).to have_http_status(200)
      end

      it 'returns user json' do
        expect(json).not_to be_nil
      end

      it 'returns first_name' do
        expect(json['user']['first_name']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { get '/my_profile', headers: { Authorization: 'dasdada' } }

      it 'does not get my_profile' do
        expect(response).to have_http_status(401)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Your session has expired. Please login again to continue./)
      end
    end
  end

  # Users update profile test suite
  describe 'PUT /my_profile' do
    context 'when valid request' do
      before { put '/my_profile', params: { user: { first_name: Faker::GameOfThrones.character } }, headers: valid_header }

      it 'returns success code' do
        expect(response).to have_http_status(200)
      end

      it 'returns user json' do
        expect(json).not_to be_nil
      end

      it 'returns first_name' do
        expect(json['user']['first_name']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { put '/my_profile', params: { user: { first_name: '' } }, headers: valid_header }

      it 'does not update my_profile' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/First name can't be blank/)
      end
    end
  end

  # Show another user test suite
  describe 'GET /users/:id' do
    context 'when valid request' do
      before { get "/users/#{user_id}", headers: valid_header }

      it 'returns success code' do
        expect(response).to have_http_status(200)
      end

      it 'returns user json' do
        expect(json).not_to be_nil
      end

      it 'returns first_name' do
        expect(json['user']['first_name']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { get "/users/#{user_id}", headers: { Authorization: 'dasdada' } }

      it 'does not get user profile' do
        expect(response).to have_http_status(401)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Your session has expired. Please login again to continue./)
      end
    end
  end

  # Check email test suite
  describe 'GET /check_email' do
    context 'when valid request' do
      before { get "/check_email", params: { user: { email: @user_attr[:email] } } }

      it 'returns success code' do
        expect(response).to have_http_status(200)
      end

      it 'returns user json' do
        expect(json).not_to be_nil
      end

      it 'returns available result' do
        expect(json['available']).not_to be_nil
      end
    end
  end

  # Reset password test suite
  describe 'POST /reset_password' do
    context 'when valid request' do
      before { post '/reset_password', params: { user: { email: @user_attr[:email] } } }

      it 'returns success code' do
        expect(response).to have_http_status(200)
      end

      it 'returns instructions json' do
        expect(json).not_to be_nil
      end

      it 'returns instructions message' do
        expect(json['message'])
          .to match(/Password reset email sent to #{@user_attr[:email]}. Please check your email address for further instructions./)
      end
    end

    context 'when invalid request' do
      before { post '/reset_password', params: { user: { email: '' } } }

      it 'does not reset_password' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message']).to match(/ is an invalid email address/)
      end
    end
  end

  # Change password test suite
  describe 'POST /change_password' do
    before { post '/auth/login', params: valid_credentials }

    let(:valid_token) {"#{json['token']['token_type']} #{json['token']['access_token']}" }

    let(:valid_header) do
      {
        Authorization: valid_token
      }
    end
    context 'when valid request' do
      before { post '/change_password', params: password_credentials, headers: valid_header }

      it 'returns success code' do
        expect(response).to have_http_status(200)
      end

      it 'returns new token' do
        expect(json['token']['access_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/change_password', params: { user: { current_password: 'password', new_password: '12345678' } }, headers: valid_header }

      it 'does not update password' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message']).to match(/Password is invalid/)
      end
    end
  end
end
