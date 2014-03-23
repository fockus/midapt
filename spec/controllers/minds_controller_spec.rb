require 'spec_helper'

describe MindsController do
  describe 'GET index' do
    it 'renders the index template' do

      get :index

      subject.current_user.should be_nil
      response.status.should be_in(302, 401) # 302 Moved Temporarily - for http requests and redirect to sing_in page and 401 Unauthorized  - for other request types
    end

    it 'renders the index template if user is signed in' do
      @user = create(:user)
      sign_in @user

      get :index

      subject.current_user.should eq @user
      expect(response).to render_template :index
    end
  end
end