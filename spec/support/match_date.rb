RSpec::Matchers.define :match_date do |expected_string|
  match do |actual|
    actual.year == 2012
  end

  #failure_message_for_should do |actual|
    #"expected that #{actual} would be a precise multiple of #{expected}"
  #end

  #failure_message_for_should_not do |actual|
    #"expected that #{actual} would not be a precise multiple of #{expected}"
  #end

  #description do
    #"be a precise multiple of #{expected}"
  #end
end
