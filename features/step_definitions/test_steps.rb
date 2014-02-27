Given(/^I have (.*) beer can$/) do |opening_balance|
  @balance = opening_balance.to_i
end

And(/^I have drunk (.*) beer cans$/) do |processed|
  @process = processed.to_i
end

When(/^I go to my fridge$/) do
  @result = @balance - @process
end

Then(/^I should see (.*) beer cans$/) do |in_stock|
  @result.should == in_stock.to_i
end