require 'spec_helper'

describe BankHoliday do
  it '.all' do
    bank_holidays = BankHoliday.all
    expect(bank_holidays.count).to eq 65
    expect(bank_holidays.first.title).to eq 'New Year’s Day'
    expect(bank_holidays.first.date).to eq '2012-01-02'

    expect(bank_holidays.last.title).to eq 'Boxing Day'
    expect(bank_holidays.last.date).to eq '2019-12-26'
  end

  it '.after' do
    date = Date.parse('02/02/2012')
    bank_holidays = BankHoliday.after(date)
    expect(bank_holidays.count).to eq 64
    expect(bank_holidays.first.title).to eq 'Good Friday'
    expect(bank_holidays.first.date).to eq '2012-04-06'

    expect(bank_holidays.last.title).to eq 'Boxing Day'
    expect(bank_holidays.last.date).to eq '2019-12-26'
  end

  it '.before' do
    date = Date.parse('07/04/2012')
    bank_holidays = BankHoliday.before(date)
    expect(bank_holidays.count).to eq 2
    expect(bank_holidays.first.title).to eq 'New Year’s Day'
    expect(bank_holidays.first.date).to eq '2012-01-02'

    expect(bank_holidays.last.title).to eq 'Good Friday'
    expect(bank_holidays.last.date).to eq '2012-04-06'
  end

  it '.future' do
    expect(Date).to receive(:today).and_return Date.parse('02/02/2012')
    bank_holidays = BankHoliday.future
    expect(bank_holidays.count).to eq 64
    expect(bank_holidays.first.title).to eq 'Good Friday'
    expect(bank_holidays.first.date).to eq '2012-04-06'

    expect(bank_holidays.last.title).to eq 'Boxing Day'
    expect(bank_holidays.last.date).to eq '2019-12-26'
  end

  it '.past' do
    expect(Date).to receive(:today).and_return Date.parse('07/04/2012')
    bank_holidays = BankHoliday.past
    expect(bank_holidays.count).to eq 2
    expect(bank_holidays.first.title).to eq 'New Year’s Day'
    expect(bank_holidays.first.date).to eq '2012-01-02'

    expect(bank_holidays.last.title).to eq 'Good Friday'
    expect(bank_holidays.last.date).to eq '2012-04-06'
  end

  it '.next' do
    expect(Date).to receive(:today).and_return Date.parse('02/02/2012')
    bank_holiday = BankHoliday.next
    expect(bank_holiday.title).to eq 'Good Friday'
    expect(bank_holiday.date).to eq '2012-04-06'
  end

  it '.last' do
    expect(Date).to receive(:today).and_return Date.parse('07/04/2012')
    bank_holiday = BankHoliday.last
    expect(bank_holiday.title).to eq 'Good Friday'
    expect(bank_holiday.date).to eq '2012-04-06'
  end

  it '.bank_holiday?' do
    date = Date.parse('07/04/2012')
    expect(BankHoliday.bank_holiday?(date)).to eq false

    date = Date.parse('06/04/2012')
    expect(BankHoliday.bank_holiday?(date)).to eq true
  end

  it 'Date#bank_holiday?' do
    date = Date.parse('07/04/2012')
    expect(date.bank_holiday?).to eq false

    date = Date.parse('06/04/2012')
    expect(date.bank_holiday?).to eq true
  end
end
