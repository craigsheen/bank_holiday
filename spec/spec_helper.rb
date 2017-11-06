require 'bank_holiday'
require 'webmock/rspec'

RSpec.configure do |config|
  config.before(:each) do
    bank_holidays_json = File.open('spec/bank_holidays.json')
    stub_request(:get, BankHoliday::URL)
      .to_return(status: 200, body: bank_holidays_json, headers: {})
  end
end
