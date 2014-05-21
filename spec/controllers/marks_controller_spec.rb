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
end
