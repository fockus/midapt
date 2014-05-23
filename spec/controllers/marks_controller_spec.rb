require 'spec_helper'

describe MarksController do
  describe 'routing' do
    it 'routes to #new' do
      expect(:get => '/minds/1/marks/new').to route_to(:controller => 'marks', :action => 'new', :mind_id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/minds/1/marks').to route_to(:controller => 'marks', :action => 'create', :mind_id => '1')
    end

    it 'routes to #update' do
      expect(:put => '/minds/1/marks/2').to route_to(:controller => 'marks', :action => 'update', :mind_id => '1', :id => '2')
    end

    it 'routes to #destroy' do
      expect(:delete => '/minds/1/marks/2').to route_to(:controller => 'marks', :action => 'destroy', :mind_id => '1', :id => '2')
    end
  end

  describe 'actions' do
    let!(:user) { create(:user) }
    let!(:mind) { create(:mind) }
    let!(:mark) { build(:mark, user: user, markable: mind) }
    describe '#create' do
      describe 'anonymous' do
        before do
          post :create, :mind_id => mind.id, :mark => mark.attributes
        end

        it('current_user') { expect(subject.current_user).to be_nil }

        it('should forbidden reject') { expect(response.status).to be_in([302, 401]) }
      end

      describe 'user' do
        before :each do
          sign_in user
        end

        it('current_user') { expect(subject.current_user).to eq(user) }

        context 'when mind does not exist' do
          before do
            post :create, :mind_id => 0, :mark => mark.attributes
          end

          it('should return 404') { expect(response.status).to eq(404) }
        end

        context 'when mind exists' do
          before do
            post :create, :mind_id => mind.id, :mark => mark.attributes
          end

          it { expect(response).to redirect_to(mind_path(mind)) }
        end

        context 'when mark exists' do
          let!(:mark) { create(:mark, user: user, markable: mind) }
          before do
            post :create, :mind_id => mind.id, :mark => mark.attributes
          end

          it { expect(response).to redirect_to(mind_path(mind)) }

          it('should flash alert') { expect(flash[:alert]).to be }
        end
      end
    end
  end
end
