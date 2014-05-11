require 'spec_helper'

describe Mind do
  describe 'title' do
    context 'when valid' do
      it 'should accept valid title' do
        mind_valid_title = Mind.new(title: Forgery(:basic).text(:at_least => 5, :at_most => 100))

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
        mind_short_title = Mind.new(title: Forgery(:basic).text(:at_least => 1, :at_most => 4))

        mind_short_title.valid?

        mind_short_title.errors[:title].should_not be_empty
      end

      it 'should reject long title' do
        mind_long_title = Mind.new(title: Forgery(:basic).text(:at_least => 101, :at_most => 1000))

        mind_long_title.valid?

        mind_long_title.errors[:title].should_not be_empty
      end
    end
  end

  describe 'text' do
    context 'when valid' do
      it 'should accept valid text' do
        mind_valid_text = Mind.new(text: Forgery(:basic).text(:at_least => 5, :at_most => 1000))

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
        mind_short_text = Mind.new(text: Forgery(:basic).text(:at_least => 1, :at_most => 4))

        mind_short_text.valid?

        mind_short_text.errors[:text].should_not be_empty
      end

      it 'should reject long text' do
        mind_long_text = Mind.new(text: Forgery(:basic).text(:at_least => 1001, :at_most => 10000000))

        mind_long_text.valid?

        mind_long_text.errors[:text].should_not be_empty
      end
    end
  end
  describe 'streams' do
    let(:mind) { build(:mind) }
    let(:valid_stream1) { build(:stream) }
    let(:valid_stream2) { build(:stream) }
    let(:invalid_stream) { build(:invalid_stream) }
    context 'when valid' do
      it 'should accept valid streams' do
        mind.streams_names = [valid_stream1, valid_stream2].collect(&:name).join(' ')
        mind.assign_streams

        mind.valid?

        mind.errors[:streams_names].should be_empty
      end
    end

    context 'when invalid' do
      it 'should reject invalid streams' do
        mind.streams_names = [valid_stream1, invalid_stream].collect(&:name).join(' ')
        mind.assign_streams

        mind.valid?

        mind.errors[:streams_names].should_not be_empty
      end
    end
  end
end