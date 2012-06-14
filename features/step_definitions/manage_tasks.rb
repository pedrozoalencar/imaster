Given /^the input description "([^"]*)" and input details "([^"]*)"$/ do |description, details|
	@ask = Ask.new
	@ask.description = description
	@ask.details = details
	#pending # express the regexp above with the code you wish you had
end

When /^the ask form is loaded$/ do
	@ask.save
	#pending # express the regexp above with the code you wish you had
end

Then /^the ask should be saved$/ do
	@ask.persisted?
	#pending # express the regexp above with the code you wish you had
end