

module BankHoliday

  URL = "https://www.gov.uk/bank-holidays.json"

  def self.all
    uri = URI.parse(URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    bank_holidays = response.body
    return Dish(JSON.parse(bank_holidays)["england-and-wales"]["events"])
  end

  def self.bank_holiday?(date)
    @bank_holidays||=all
    if @bank_holidays.collect {|holiday| holiday.date}.include?(date.strftime("%Y-%m-%d"))
      return true
    else
      return false
    end
  end

end