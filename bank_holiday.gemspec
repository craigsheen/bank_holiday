lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bank_holiday/version'

Gem::Specification.new do |s|
  s.name        = 'bank_holiday'
  s.version     = BankHoliday::VERSION
  s.date        = '2014-07-17'
  s.summary     = "Finding bank holidays including helpers for dates."
  s.description = "Finding bank holidays including helpers for dates."
  s.authors     = ["Craig Sheen"]
  s.email       = 'craig_sheen@hotmail.com'
  s.files       = ["lib/bank_holiday.rb"]
  s.homepage    = ''
  s.license     = 'MIT'
  
  s.add_dependency 'dish'
  s.require_paths = ["lib"]
  s.files         = `git ls-files`.split($/)
end