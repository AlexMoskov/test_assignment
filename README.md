Api client for http://numbersapi.com/

# Setup

## Local dev setup

1. bundle install

# Testing

* `rake test` — run the test suite ([MiniTest] and [VCR])
* `bundle exec ruby -Itest test/number_client/trivia_test.rb` - run the test for one file
* `rake coverage` - run generating a coverage report

# Use

### Date

* `NumberClient::Date.new.call` - returns random fact of the date
* `NumberClient::Date.new('11/3').call` - returns fact of the date
* `NumberClient::Date.new('11/3', fragment: '').call` - returns fragment fact of the date
* `NumberClient::Date.new('11/35', fragment: '').call` - returns validation error

### Math

* `NumberClient::Math.new.call` - returns random fact of the digit
* `NumberClient::Math.new(25).call` - returns fact of the digit
* `NumberClient::Math.new('25', fragment: '').call` - returns fragment fact of the digit
* `NumberClient::Math.new('25a', fragment: '').call` - returns validation error

### Trivia

* `NumberClient::Trivia.new.call` - returns random trivia fact of the digit
* `NumberClient::Trivia.new(25).call` - returns trivia fact of the digit
* `NumberClient::Trivia.new('25', fragment: '').call` - returns fragment trivia fact of the digit
* `NumberClient::Trivia.new('aa', fragment: '').call` - returns validation error

### Year

* `NumberClient::Year.new.call` - returns random fact of the year
* `NumberClient::Year.new(1225).call` - returns fact of the year
* `NumberClient::Year.new(1225, fragment: '').call` - returns fragment fact of the year
* `NumberClient::Year.new('a25a', fragment: '').call` - returns validation error
