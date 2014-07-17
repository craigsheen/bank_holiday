# Bank Holiday

Retrieve UK bank holidays in a nice format and includes handy Rails helpers for dates.

## Installation

Add this line to your application's Gemfile:

    gem 'bank_holiday'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bank_holiday

## Usage

### Helpers

If you want to see if a date is a bank holiday then simply use;

    date = Date.today
    => Thu, 17 Jul 2014
    
    date.bank_holiday?
    => false
    
    date = Date.parse("25/08/2014")
    => Mon, 25 Aug 2014
    
    date.bank_holiday?
    => true
    
### Accessing Holidays

To return all bank holidays

    bank_holidays = BankHoliday.all

This uses the Dish gem to allow easy access to the objects;

    bank_holidays.first.title
    => "New Year’s Day"
     
    bank_holiday.first.date
    => "2012-01-02"
      
    bank_holiday.first.notes
    => "Substitute day"
    
    bank_holiday.first.bunting
    => true
    
## Future

I would like to add other options/features to this and would welcome any improvements or changes.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request