require 'spec_helper'

def with_user(role)
  (role == :anonymous) ? nil : create(role)
end

def act(action, resource)
  case action
    when :index
      get action
    when :new
      get action
    when :create
      post action, :stream => resource.attributes
    when :edit
      put action, :id => resource.id, :stream => resource.attributes
    when :destroy
      delete action, :id => resource.id
    else
  end
end

def get_action_resource(action)
  case action
    when :index
      get action
    when :new
      get action
    when :create
      return build(:stream)
    when :edit
      return create(:stream)
    when :destroy
      return create(:stream)
    else
  end
end

describe StreamsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/streams').to route_to(:controller => 'streams', :action => 'index')
    end

    it 'routes to #show' do
      expect(:get => '/streams/1').to route_to(:controller => 'streams', :action => 'show', :id => '1')
    end

    it 'routes to #new' do
      expect(:get => '/streams/new').to route_to(:controller => 'streams', :action => 'new')
    end

    it 'routes to #create' do
      expect(:post => '/streams/').to route_to(:controller => 'streams', :action => 'create')
    end

    it 'routes to #update' do
      expect(:put => '/streams/1').to route_to(:controller => 'streams', :action => 'update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/streams/1').to route_to(:controller => 'streams', :action => 'destroy', :id => '1')
    end
  end

  describe 'actions' do
    describe 'index' do
      [:anonymous, :user].each do |u|
        context 'when ' + u.to_s do
          let(:user) { with_user(u) }
          let(:stream1) { create(:stream) }
          let(:stream2) { create(:stream) }
          let(:stream3) { create(:stream) }
          before(:each) do
            sign_in user unless user.nil?
            get :index
          end
          it('should render template') { expect(response).to render_template 'index' }

          it('should assign @streams') { expect(assigns(:streams)).to match_array([stream1, stream2, stream3]) }
        end
      end
    end

    [:new, :create, :edit, :destroy].each do |action|
      describe action do
        [:anonymous, :user].each do |u|
          context 'when ' + u.to_s do
            let(:user) { with_user u }
            before(:each) do
              sign_in user unless user.nil?
              act(action, get_action_resource(action))
            end

            it('should forbidden reject') { expect(response.status).to eq(403) }
          end
        end
      end
    end
  end
end
