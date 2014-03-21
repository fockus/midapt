require 'spec_helper'

describe MindsController do
  describe 'GET index' do
    it 'renders the index template' do
      @user = create(:user)
      sign_in @user

      get :index

      expect(response).to render_template :index
    end
  end
end