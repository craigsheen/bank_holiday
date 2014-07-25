# Bank Holiday

Retrieve UK bank holidays in a nice format and includes handy Rails helpers for dates.

## Installation

Add this line to your application's Gemfile:

    gem "bank_holiday"

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
    
There is also some other helpful methods;

    after_date = BankHoliday.after(Date.today)
    => [#<Dish::Plate:0x007f831e886c80 @_original_hash={"title"=>"Summer bank holiday", "date"=>"2014-08-25", "notes"=>"", "bunting"=>true}>, #<Dish::Plate:0x007f831e886aa0 @_original_hash={"title"=>"Christmas Day", "date"=>"2014-12-25", "notes"=>"", "bunting"=>true}>, #<Dish::Plate:0x007f831e8868c0 @_original_hash={"title"=>"Boxing Day", "date"=>"2014-12-26", "notes"=>"", "bunting"=>true}>...]
    
    before_date = BankHoliday.before(1.month.ago)
    => [#<Dish::Plate:0x007f831e855630 @_original_hash={"title"=>"New Year’s Day", "date"=>"2012-01-02", "notes"=>"Substitute day", "bunting"=>true}>, #<Dish::Plate:0x007f831e855450 @_original_hash={"title"=>"Good Friday", "date"=>"2012-04-06", "notes"=>"", "bunting"=>false}>, #<Dish::Plate:0x007f831e855270 @_original_hash={"title"=>"Easter Monday", "date"=>"2012-04-09", "notes"=>"", "bunting"=>true}>...]
    
    next = BankHoliday.next
    => #<Dish::Plate:0x007f831e886c80 @_original_hash={"title"=>"Summer bank holiday", "date"=>"2014-08-25", "notes"=>"", "bunting"=>true}>
    
    last = BankHoliday.last
    => #<Dish::Plate:0x007f831e886e60 @_original_hash={"title"=>"Spring bank holiday", "date"=>"2014-05-26", "notes"=>"", "bunting"=>true}>
    
    future = BankHoliday.future
    => [#<Dish::Plate:0x007f831e886c80 @_original_hash={"title"=>"Summer bank holiday", "date"=>"2014-08-25", "notes"=>"", "bunting"=>true}>, #<Dish::Plate:0x007f831e886aa0 @_original_hash={"title"=>"Christmas Day", "date"=>"2014-12-25", "notes"=>"", "bunting"=>true}>, #<Dish::Plate:0x007f831e8868c0 @_original_hash={"title"=>"Boxing Day", "date"=>"2014-12-26", "notes"=>"", "bunting"=>true}>...]
    
    past = BankHoliday.past
    => [#<Dish::Plate:0x007f831e855630 @_original_hash={"title"=>"New Year’s Day", "date"=>"2012-01-02", "notes"=>"Substitute day", "bunting"=>true}>, #<Dish::Plate:0x007f831e855450 @_original_hash={"title"=>"Good Friday", "date"=>"2012-04-06", "notes"=>"", "bunting"=>false}>, #<Dish::Plate:0x007f831e855270 @_original_hash={"title"=>"Easter Monday", "date"=>"2012-04-09", "notes"=>"", "bunting"=>true}>...]
    
## Future

I would like to add other options/features to this and would welcome any improvements or changes.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request