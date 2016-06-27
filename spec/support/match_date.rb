require 'rspec/expectations'

RSpec::Matchers.define :match_date do |expected|
  match do |actual|
    parsed = DateTime.parse(expected)
    # actual.year == parsed.year
    # actual.month == parsed.month
    # actual.day == parsed.day
    format_date(actual) == format_date(parsed)
  end

  failure_message do |actual|
    "expected '#{format_date actual}' to match '#{expected}'"
  end

  failure_message_when_negated do |actual|
    "expected '#{format_date actual}' not to match '#{expected}' "
  end

  def format_date date
      "%d-%02d-%02d" % [date.year, date.month, date.day]
  end
end
