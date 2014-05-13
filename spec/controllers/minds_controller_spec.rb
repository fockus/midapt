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
  describe 'actions' do
    let!(:user) { create(:user) }
    describe '#index' do
      context 'when user is not signed in' do
        it 'renders the index template' do

          get :index

          expect(subject.current_user).to be_nil
          [302, 401].should include response.status # 302 Moved Temporarily - for http requests and redirect to sing_in page and 401 Unauthorized  - for other request types
        end
      end

      context 'when user is signed in' do
        let!(:mind1) { create(:mind, user: user) }
        let!(:mind2) { create(:mind, user: user) }
        let!(:mind3) { create(:mind, user: create(:user)) }
        before do
          sign_in user
          get :index
        end
        it 'should accept signed in user' do
          expect(subject.current_user).to eq(user)
        end

        it { expect(response).to render_template :index }

        it "should assign user's minds" do
          expect(assigns(:minds)).to match_array([mind1, mind2])
        end

        it "shouldn't assign other user's minds" do
          expect(assigns(:minds)).not_to include(mind3)
        end
      end
    end

    describe '#create' do
      context 'when valid' do
        let!(:mind) { build(:mind) }
        before do
          sign_in user
          mind.streams_names = FactoryGirl.generate(:valid_stream_name)
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
          sign_in user
          invalid_mind.streams_names = FactoryGirl.generate(:invalid_stream_name)
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

          mind.text = FactoryGirl.generate(:valid_mind_text)
          mind.streams_names = FactoryGirl.generate(:valid_stream_name)
          put :update, :id => mind.id, :mind => mind.attributes
        end

        it { expect(response).to redirect_to(mind_path(mind)) }

        it 'should flash notice' do
          expect(flash[:notice]).to be
        end
      end

      context 'when invalid' do
        let!(:mind) { create(:mind) }
        before do
          sign_in mind.user

          mind.text = FactoryGirl.generate(:invalid_mind_text)
          mind.streams_names = FactoryGirl.generate(:invalid_stream_name)
          put :update, :id => mind.id, :mind => mind.attributes
        end

        it { expect(response).to render_template(:edit) }
      end
    end
  end
end


