require 'spec_helper'

describe MindsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/minds').to route_to(:controller => 'minds', :action => 'index')
    end

    it 'routes to #user_index' do
      expect(:get => '/my/minds').to route_to(:controller => 'minds', :action => 'user_index')
    end

    it 'routes to #show' do
      expect(:get => '/minds/1').to route_to(:controller => 'minds', :action => 'show', :id => '1')
    end

    it 'routes to #new' do
      expect(:get => '/minds/new').to route_to(:controller => 'minds', :action => 'new')
    end

    it 'routes to #create' do
      expect(:post => '/minds/').to route_to(:controller => 'minds', :action => 'create')
    end

    it 'routes to #update' do
      expect(:put => '/minds/1').to route_to(:controller => 'minds', :action => 'update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/minds/1').to route_to(:controller => 'minds', :action => 'destroy', :id => '1')
    end

  end
  describe 'actions' do
    let!(:user) { create(:user) }

    describe '#index' do
      context 'when user is signed in' do
        let!(:mind1) { create(:mind) }
        let!(:mind2) { create(:mind) }
        let!(:mind3) { create(:mind) }
        before do
          get :index
        end

        it { expect(response).to render_template :index }

        it 'should assign all minds' do
          expect(assigns(:minds)).to match_array([mind1, mind2, mind3])
        end
      end
    end

    describe '#user_index' do
      context 'when user is not signed in' do
        it 'renders the index template' do

          get :user_index

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
          get :user_index
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


    describe '#show' do
      context 'when mind exists' do
        let!(:mind) { create(:mind) }
        before do
          get :show, :id => mind.id
        end

        it { expect(response).to render_template :show }

        it 'should assign mind' do
          expect(assigns(:mind)).to eq(mind)
        end
      end

      context "when mind doesn't exist" do
        before do
          get :show, :id => 0
        end
        it { expect(response.status).to eq(404) }
      end
    end

    describe '#show' do
      let!(:mind) { create(:mind) }
      let!(:comment1) { create(:comment, user: user, mind: mind) }
      let!(:comment2) { create(:comment, user: user, mind: mind) }
      before do
        sign_in user
        get :show, :id => mind.id
      end

      it 'should assign mind' do
        expect(assigns(:mind)).to eq(mind)
      end

      it "should assign mind's comment" do
        expect(assigns(:mind).comments).to match_array([comment1, comment2])
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

        it 'assigned mind has errors' do
          expect(assigns(:mind).errors).to_not be_empty
        end

        it 'assigned mind is not saved' do
          expect(assigns(:mind)).to be_new_record
        end
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

        it 'assigned mind has errors' do
          expect(assigns(:mind).errors).to_not be_empty
        end
      end
    end
  end
end


