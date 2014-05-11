require 'spec_helper'

describe Stream do
  describe 'name' do
    context 'when valid' do
      it 'should accept valid name' do
        stream_valid_name = Stream.new(name: Forgery(:basic).text(:at_least => 3, :at_most => 30) )

        stream_valid_name.valid?

        stream_valid_name.errors[:name].should be_empty
      end
    end

    context 'when invalid' do
      it 'should reject nil name' do
        stream_nil_name= Stream.new(name: nil)

        stream_nil_name.valid?

        stream_nil_name.errors[:name].should_not be_empty
      end

      it 'should reject short name' do
        stream_short_name = Stream.new(name: Forgery(:basic).text(:at_least => 1, :at_most => 2) )

        stream_short_name.valid?

        stream_short_name.errors[:name].should_not be_empty
      end

      it 'should reject long name' do
        stream_long_name = Stream.new(name: Forgery(:basic).text(:at_least => 31, :at_most => 100) )

        stream_long_name.valid?

        stream_long_name.errors[:name].should_not be_empty
      end
    end
  end

end