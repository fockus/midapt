require 'spec_helper'

describe MindsController do
  describe 'GET index' do
    xit 'renders the index template' do

      get :index

      subject.current_user.should be_nil
      response.status.should eq 403
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