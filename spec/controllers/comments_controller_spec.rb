require 'spec_helper'

describe CommentsController do
  describe 'routing' do
    it 'routes to #new' do
      expect(:get => '/minds/1/comments/new').to route_to(:controller => 'comments', :action => 'new', :mind_id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/minds/1/comments').to route_to(:controller => 'comments', :action => 'create', :mind_id => '1')
    end

    it 'routes to #update' do
      expect(:put => '/minds/1/comments/2').to route_to(:controller => 'comments', :action => 'update', :mind_id => '1', :id => '2')
    end

    it 'routes to #destroy' do
      expect(:delete => '/minds/1/comments/2').to route_to(:controller => 'comments', :action => 'destroy', :mind_id => '1', :id => '2')
    end
  end

  describe 'actions' do
    let!(:user) { create(:user) }
    let!(:mind) { create(:mind) }
    describe '#new' do
      context 'when user is not signed in' do
        it 'redirects to sign in page or returns 401' do

          get :new, :mind_id => mind.id

          [302, 401].should include response.status # 302 Moved Temporarily - for http requests and redirect to sing_in page and 401 Unauthorized  - for other request types
        end
      end

      context 'when mind does not exist' do
        before do
          sign_in user
          get :new, :mind_id => '0'
        end

        it 'should return 404' do
          expect(response.status).to eq(404)
        end
      end

      context 'when mind exists' do
        before do
          sign_in user
          get :new, :mind_id => mind.id
        end

        it { expect(response).to render_template :new }
      end
    end

    describe '#create' do
      let!(:comment) { build(:comment, mind: mind, user: user) }
      context 'when user is not signed in' do
        it 'should redirect to sign in page or returns 401' do

          post :create, :mind_id => mind.id, :comment => comment.attributes

          [302, 401].should include response.status # 302 Moved Temporarily - for http requests and redirect to sing_in page and 401 Unauthorized  - for other request types
        end
      end

      context 'when mind does not exist' do
        before do
          sign_in user
          post :create, :mind_id => '0', :comment => comment.attributes
        end

        it 'should return 404' do
          expect(response.status).to eq(404)
        end
      end

      context 'when comment is valid' do
        before do
          sign_in user
          post :create, :mind_id => mind.id, :comment => comment.attributes
        end

        it { expect(response).to redirect_to(mind_path(mind)) }

        it 'should flash notice' do
          expect(flash[:notice]).to be
        end
      end

      context 'when comment is invalid' do
        let!(:invalid_comment) { build(:invalid_comment, mind: mind, user: user) }
        before do
          sign_in user
          post :create, :mind_id => mind.id, :comment => invalid_comment.attributes
        end

        it { expect(response).to render_template :new }

        it 'assigned comment has errors' do
          expect(assigns(:comment).errors).to_not be_empty
        end

        it 'assigned comment is not saved' do
          expect(assigns(:comment)).to be_new_record
        end

      end
    end
  end
end