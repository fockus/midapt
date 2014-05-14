require 'spec_helper'

describe CommentsController do
  describe 'routing' do
    it 'routes to #new' do
      expect(:get => '/my/minds/1/comments/new').to route_to(:controller => 'comments', :action => 'new', :mind_id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/my/minds/1/comments').to route_to(:controller => 'comments', :action => 'create', :mind_id => '1')
    end

    it 'routes to #update' do
      expect(:put => '/my/minds/1/comments/2').to route_to(:controller => 'comments', :action => 'update', :mind_id => '1', :id => '2')
    end

    it 'routes to #destroy' do
      expect(:delete => '/my/minds/1/comments/2').to route_to(:controller => 'comments', :action => 'destroy', :mind_id => '1', :id => '2')
    end
  end
end