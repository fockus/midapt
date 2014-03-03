When(/^у меня было (.*) банок пива$/) do |opening_balance|
  @balance = opening_balance.to_i
end

When(/^я выпил (.*) банок пива$/) do |processed|
  @process = processed.to_i
end

When(/^я подойду и открою холодильник$/) do
  @result = @balance - @process
end

When(/^должен увидеть (.*) банок пива$/) do |in_stock|
  @result.should == in_stock.to_i
end