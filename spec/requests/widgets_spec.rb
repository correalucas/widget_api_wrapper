require 'rails_helper'

RSpec.describe 'Widgets API', type: :request do
  let(:widget) { build(:widget) }

  let(:login_credentials) do
    {
      username: 'new_user@hostuser.com',
      password: 'new_password'
    }
  end

  before do
    post '/auth/login', params: login_credentials
    @login_json = json
  end

  let(:valid_token) {"#{@login_json['token']['token_type']} #{@login_json['token']['access_token']}" }

  let(:user_id) { 7 }

  let(:valid_header) do
    {
      Authorization: valid_token
    }
  end

  before do
    get '/my_widgets', headers: valid_header
    @widget = json['widgets'].first
    @widget_id = @widget['id']
  end

  # Users widgets list test suite
  describe 'GET /widgets' do
    context 'when valid request' do
      before { get '/widgets', headers: valid_header }

      it 'returns success code' do
        expect(response).to have_http_status(200)
      end

      it 'returns widget json' do
        expect(json).not_to be_nil
      end

      it 'returns a array of widgets' do
        expect(json['widgets']).to be_an_instance_of(Array)
      end
    end

    context 'when invalid request' do
      before { get '/widgets', headers: { Authorization: 'dasdada' } }

      it 'does not get widgets' do
        expect(response).to have_http_status(401)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Your session has expired. Please login again to continue./)
      end
    end
  end

  # Visible widgets test suite
  describe 'GET /widgets/visible' do
    context 'when valid request' do
      before { get '/widgets/visible' }

      it 'returns success code' do
        expect(response).to have_http_status(200)
      end

      it 'returns widget json' do
        expect(json).not_to be_nil
      end

      it 'returns a array of widgets' do
        expect(json['widgets']).to be_an_instance_of(Array)
      end
    end
  end

  describe 'GET /my_widgets' do
    context 'when valid request' do
      before { get '/my_widgets', headers: valid_header }

      it 'returns success code' do
        expect(response).to have_http_status(200)
      end

      it 'returns widget json' do
        expect(json).not_to be_nil
      end

      it 'returns a array of widgets' do
        expect(json['widgets']).to be_an_instance_of(Array)
      end
    end

    context 'when invalid request' do
      before { get '/my_widgets', headers: { Authorization: 'dasdada' } }

      it 'does not get widgets' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/That user does not exist/)
      end
    end
  end

  describe 'GET /users/:id/widgets' do
    context 'when valid request' do
      before { get "/users/#{user_id}/widgets", headers: valid_header }

      it 'returns success code' do
        expect(response).to have_http_status(200)
      end

      it 'returns widget json' do
        expect(json).not_to be_nil
      end

      it 'returns a array of widgets' do
        expect(json['widgets']).to be_an_instance_of(Array)
      end
    end
  end

   # Widget create test suite
  describe 'POST /widgets' do
    context 'when valid request' do
      before {
        post '/widgets', params: { widget: attributes_for(:widget) }, headers: valid_header
        @widget_id = json['widget']['id']
      }
      it 'creates a new widget' do
        expect(response).to have_http_status(201)
      end

      it 'returns created widget json' do
        expect(json).not_to be_nil
      end

      it 'returns a widget name' do
        expect(json['widget']['name']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/widgets', params: { widget: {} }, headers: valid_header }
      it 'does not create a new widget' do
        expect(response).to have_http_status(400)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Unfortunately you need to supply the parameter 'widget' to continue/)
      end
    end
  end

  # Widget update test suite
  describe 'PUT /widgets/:id' do
    context 'when valid request' do
      let(:description) { Faker::GameOfThrones.quote }
      before { put "/widgets/#{@widget_id}", params: { widget: { description: description } }, headers: valid_header }

      it 'update the passed widget' do
        expect(response).to have_http_status(200)
      end

      it 'returns updated widget json' do
        expect(json).not_to be_nil
      end

      it 'returns a widget name' do
        expect(json['widget']['description']).to eq(description)
      end
    end

    context 'when invalid request' do
      before { put "/widgets/#{@widget_id}", params: { widget: { name: '' } }, headers: valid_header }

      it 'does not update widget' do
        expect(response).to have_http_status(422)
      end

      it 'do not returns failure message' do
        expect(json['message'])
          .to be_nil
      end
    end
  end

  # Widget delete test suite
  describe 'DEL /widgets/:id' do
    context 'when valid request' do
      let(:description) { Faker::GameOfThrones.quote }
      before { delete "/widgets/#{@widget_id}", headers: valid_header }

      it 'update the passed widget' do
        expect(response).to have_http_status(200)
      end

      it 'returns updated widget json' do
        expect(json).not_to be_nil
      end

      it 'returns a widget name' do
        expect(json['message']).to eq('Success')
      end
    end

    context 'when invalid request' do
      before { delete "/widgets/#{@widget_id}", headers: { Authorization: 'dasdada' } }

      it 'does not update widget' do
        expect(response).to have_http_status(401)
      end

      it 'do not returns failure message' do
        expect(json['message'])
          .to match(/Your session has expired. Please login again to continue./)
      end
    end
  end
end
