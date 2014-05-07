require 'spec_helper'

def sign_in_user
  @user = create(:user)
  sign_in @user
end

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
  describe '#index' do
    it 'renders the index template' do

      get :index

      expect(subject.current_user).to be_nil
      [302, 401].should include response.status # 302 Moved Temporarily - for http requests and redirect to sing_in page and 401 Unauthorized  - for other request types
    end

    it 'renders the index template if user is signed in' do
      sign_in_user

      get :index

      expect(subject.current_user).to eq(@user)
      expect(response).to render_template :index
    end
  end

  describe '#create' do
    context 'when valid' do
      let!(:mind) { build(:mind) }
      before do
        sign_in_user
        post :create, :mind => mind.attributes
      end

      it { expect(response).to redirect_to(mind_path(1)) }

      it 'should flash notice' do
        expect(flash[:notice]).to be
      end
    end

    context 'when invalid' do
      let!(:invalid_mind) { build(:invalid_mind) }
      before do
        sign_in_user
        post :create, :mind => invalid_mind.attributes
      end

      it { expect(response).to render_template(:new) }
    end
  end
  describe '#update' do
    context 'when valid' do
      let!(:mind) { create(:mind) }
      before do
        sign_in mind.user

        mind.text = 'new valid text'
        put :update, :id => mind.id, :mind => mind.attributes
      end

      it { expect(response).to redirect_to(mind_path(mind))}

      it 'should flash notice' do
        expect(flash[:notice]).to be
      end
    end

    context 'when invalid' do
      let!(:mind) { create(:mind) }
      before do
        sign_in mind.user

        mind.text = '' # invalid text
        put :update, :id => mind.id, :mind => mind.attributes
      end

      it { expect(response).to render_template(:edit)}
    end
  end
end


