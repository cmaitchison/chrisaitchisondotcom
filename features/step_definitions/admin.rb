Given /I am logged in/ do
  visit "/admin/session/new"
  check "bypass_login"
  click_button "Login with Google account"
end

Then /a RuntimeError is thrown when I press "(.*)"/ do |button|
  lambda {
    click_button(button)
  }.should raise_error
end

Then /^the comment exists$/ do
  Comment.count.should == 2
end

Given /^the following comments? exists:$/ do |comment_table|
  comment_table.hashes.each do |hash|
    Factory(:comment, hash)
  end
end

Given /^a comment exists with attributes:$/ do |comment_table|
  comment_table.hashes.each do |hash|
    Comment.find(:first, :conditions => hash).should_not be_nil
  end
end

Given /^a comment does not exist with attributes:$/ do |comment_table|
  comment_table.hashes.each do |hash|
    Comment.find(:first, :conditions => hash).should be_nil
  end
end
