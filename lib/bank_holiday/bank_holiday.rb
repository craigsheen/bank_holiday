require 'dish/ext'

module BankHoliday
  URL = "https://www.gov.uk/bank-holidays.json"

  def self.all
    uri = URI.parse(URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    bank_holidays = response.body
    Dish(JSON.parse(bank_holidays)['england-and-wales']['events'])
  end

  def self.after(date)
    @bank_holidays ||= all
    @bank_holidays.reject { |holiday| Date.parse(holiday.date) <= date }
  end

  def self.before(date)
    @bank_holidays ||= all
    @bank_holidays.reject { |holiday| Date.parse(holiday.date) >= date }
  end

  def self.next
    future.first
  end

  def self.last
    past.last
  end

  def self.future
    @bank_holidays ||= all
    today = Date.today
    @bank_holidays.reject { |holiday| Date.parse(holiday.date) <= today }
  end

  def self.past
    @bank_holidays ||= all
    today = Date.today
    @bank_holidays.reject { |holiday| Date.parse(holiday.date) >= today }
  end

  def self.bank_holiday?(date)
    @bank_holidays ||= all
    return true if @bank_holidays.collect(&:date).include?(date.strftime('%Y-%m-%d'))
    false
  end
end
