lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bank_holiday/version'

Gem::Specification.new do |s|
  s.name        = 'bank_holiday'
  s.version     = BankHoliday::VERSION
  s.date        = '2017-11-06'
  s.summary     = "Finding bank holidays including helpers for dates."
  s.description = "Finding bank holidays including helpers for dates."
  s.authors     = ["Craig Sheen"]
  s.email       = 'craig_sheen@hotmail.com'
  s.files       = ["lib/bank_holiday.rb"]
  s.homepage    = 'https://github.com/craigsheen/bank_holiday'
  s.license     = 'MIT'

  s.add_dependency 'dish'
  s.require_paths = ["lib", "lib/bank_holiday"]
  s.files         = `git ls-files`.split($/)
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'
end
