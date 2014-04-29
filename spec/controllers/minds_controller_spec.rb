require 'spec_helper'

describe MindsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/my/minds').to route_to(:controller => 'minds', :action => 'index')
    end

    it 'routes to #show' do
      expect(:get => '/my/minds/1').to route_to(:controller => 'minds', :action => 'show', :id => '1')
    end

    it 'routes to #new' do
      expect(:get => '/my/minds/new').to route_to(:controller => 'minds', :action => 'new')
    end

    it 'routes to #create' do
      expect(:post => '/my/minds/').to route_to(:controller => 'minds', :action => 'create')
    end

    it 'routes to #update' do
      expect(:put => '/my/minds/1').to route_to(:controller => 'minds', :action => 'update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/my/minds/1').to route_to(:controller => 'minds', :action => 'destroy', :id => '1')
    end

  end
  describe 'GET index' do
    it 'renders the index template' do

      get :index

      subject.current_user.should be_nil
      [302, 401].should include response.status # 302 Moved Temporarily - for http requests and redirect to sing_in page and 401 Unauthorized  - for other request types
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