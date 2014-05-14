require 'spec_helper'

describe Mind do
  describe 'title' do
    context 'when valid' do
      it 'should accept valid title' do
        mind_valid_title = Mind.new(title: FactoryGirl.generate(:valid_mind_title))

        mind_valid_title.valid?

        mind_valid_title.errors[:title].should be_empty
      end
    end

    context 'when invalid' do
      it 'should reject nil title' do
        mind_nil_title = Mind.new(title: nil)

        mind_nil_title.valid?

        mind_nil_title.errors[:title].should be_empty
      end

      it 'should reject short title' do
        mind_short_title = Mind.new(title: FactoryGirl.generate(:short_mind_title))

        mind_short_title.valid?

        mind_short_title.errors[:title].should_not be_empty
      end

      it 'should reject long title' do
        mind_long_title = Mind.new(title: FactoryGirl.generate(:long_mind_title))

        mind_long_title.valid?

        mind_long_title.errors[:title].should_not be_empty
      end
    end
  end

  describe 'text' do
    context 'when valid' do
      it 'should accept valid text' do
        mind_valid_text = Mind.new(text: FactoryGirl.generate(:valid_mind_text))

        mind_valid_text.valid?

        mind_valid_text.errors[:text].should be_empty
      end

    end

    context 'when invalid' do
      it 'should reject nil text' do
        mind_nil_text = Mind.new(text: nil)

        mind_nil_text.valid?

        mind_nil_text.errors[:text].should_not be_empty
      end

      it 'should reject short text' do
        mind_short_text = Mind.new(text: FactoryGirl.generate(:short_mind_text))

        mind_short_text.valid?

        mind_short_text.errors[:text].should_not be_empty
      end

      it 'should reject long text' do
        mind_long_text = Mind.new(text: FactoryGirl.generate(:long_mind_text))

        mind_long_text.valid?

        mind_long_text.errors[:text].should_not be_empty
      end
    end
  end
  describe 'streams' do
    let(:mind) { build(:mind) }
    context 'when valid' do
      it 'should accept valid streams' do
        mind.streams_names = [FactoryGirl.generate(:valid_stream_name), FactoryGirl.generate(:valid_stream_name)].join(' ')
        mind.assign_streams

        mind.valid?

        mind.errors[:streams_names].should be_empty
      end
    end

    context 'when invalid' do
      it 'should reject invalid streams' do
        mind.streams_names = [FactoryGirl.generate(:valid_stream_name), FactoryGirl.generate(:invalid_stream_name)].join(' ')
        mind.assign_streams

        mind.valid?

        mind.errors[:streams_names].should_not be_empty
      end
    end
  end
end