require 'spec_helper'

describe HomeController do
  describe 'routing' do

  end

  describe 'actions' do
    describe '#index' do
      context 'when no params' do
        it 'should render index' do
          get :index

          expect(response).to render_template :index
        end
      end

      context 'when searching streams minds' do
        let!(:stream1) { create(:stream) }
        let!(:stream2) { create(:stream) }
        let!(:stream3) { create(:stream) }
        let!(:mind1) { create(:mind, streams: [stream1, stream2]) }
        let!(:mind2) { create(:mind, streams: [stream2]) }
        let!(:mind3) { create(:mind, streams: [stream3]) }
        before do
          get :index, {:search => stream2.name}
        end

        it 'should assign searched minds' do
          expect(assigns(:minds)).to match_array([mind1, mind2])
        end

        it "shouldn't assign not matched minds" do
          expect(assigns(:minds)).not_to include(mind3)
        end
      end
    end
  end
end