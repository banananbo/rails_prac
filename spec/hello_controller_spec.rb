require 'rails_helper'

describe HomeController, type: :controller do
    describe 'GET #index' do
      it 'リクエストが成功すること' do
        get :index
        expect(response.status).to eq 200
      end
    end
end
