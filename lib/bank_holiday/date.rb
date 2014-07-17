require 'bank_holiday'

class Date
    
  def bank_holiday?
    BankHoliday.bank_holiday?(self)
  end
    
end