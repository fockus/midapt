require 'spec_helper'

describe Mind do

  it "validates its title and makes sure that it's empty or it's consisted of 5-100 symbols" do
    mind_nil_title = Mind.new(title: nil)
    mind_short_title = Mind.new(title: Forgery(:basic).text(:at_least => 1, :at_most => 4) )
    mind_valid_title = Mind.new(title: Forgery(:basic).text(:at_least => 5, :at_most => 100 ) )
    mind_long_title = Mind.new(title: Forgery(:basic).text(:at_least => 101, :at_most => 1000 ) )

    mind_nil_title.valid?
    mind_short_title.valid?
    mind_valid_title.valid?
    mind_long_title.valid?

    mind_nil_title.errors[:title].should be_empty
    mind_short_title.errors[:title].should_not be_empty
    mind_valid_title.errors[:title].should be_empty
    mind_long_title.errors[:title].should_not be_empty
  end

  it "validates its text and makes sure that it exists and it's consisted of 5-1000 symbols" do
    mind_nil_text = Mind.new(text: nil)
    mind_short_text = Mind.new(text: Forgery(:basic).text(:at_least => 1, :at_most => 4) )
    mind_valid_text = Mind.new(text: Forgery(:basic).text(:at_least => 5, :at_most => 1000) )
    mind_long_text = Mind.new(text: Forgery(:basic).text(:at_least => 1001, :at_most => 10000000) )

    mind_nil_text.valid?
    mind_short_text.valid?
    mind_valid_text.valid?
    mind_long_text.valid?

    mind_short_text.errors[:text].should_not be_empty
    mind_valid_text.errors[:text].should be_empty
    mind_long_text.errors[:text].should_not be_empty
    mind_nil_text.errors[:text].should_not be_empty
  end
end