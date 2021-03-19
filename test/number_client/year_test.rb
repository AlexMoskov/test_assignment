require 'test_helper'
require_relative '../../number_client/year'

class NumberClient::YearTest < Minitest::Test
  # http://numbersapi.com/random/year
  def test_random_fact
  	fact = "658 is the year that the Union of Slavic Tribes falls apart after King Samo's death."

  	VCR.use_cassette("random_year_call") do
      assert_equal fact, NumberClient::Year.new.call, 
        "NumberClient::Year.new.call should return a string with random fact of the year"
    end
  end

  # http://numbersapi.com/1999/year
  def test_fact_about_year
  	year = 1999
    fact = "1999 is the year that Texas Governor George W. Bush announces he will seek the Republican Party nomination for President of the United States."

  	VCR.use_cassette("fact_about_year") do
      assert_equal fact, NumberClient::Year.new(year).call, 
        "NumberClient::Year.new(#{year}).call should return a string with fact of the year"
    end
  end

  # http://numbersapi.com/2012/year?fragment=
  def test_fragment_fact_about_year
  	year = 2012
    fact = "a fire at a prison in Comayagua, Honduras kills at least 357"

  	VCR.use_cassette("fragment_fact_about_year") do
      assert_equal fact, NumberClient::Year.new(year, fragment: '').call, 
        "NumberClient::Year.new(#{year}, fragment: '').call should return a string with fragment fact of the year"
    end
  end

  # http://numbersapi.com/-3319/year?notfound=ceil
  def test_notfound_ceil_fact_about_year
  	year = -3319
    fact = "1225 BC is the year that ramses II, a pharaoh of Egypt died, having fathered 96 sons and 60 daughters."

  	VCR.use_cassette("notfound_ceil_fact_about_year") do
      assert_equal fact, NumberClient::Year.new(year, notfound: 'ceil').call, 
        "NumberClient::Year.new(#{year}, notfound: 'ceil').call should return a string with ceil fact of the year"
    end
  end

  # http://numbersapi.com/-3319/year?notfound=ceil&fragment=
  def test_notfound_ceil_fragment_fact_about_year
  	year = -3319
    fact = "ramses II, a pharaoh of Egypt died, having fathered 96 sons and 60 daughters"

  	VCR.use_cassette("notfound_ceil_fragment_fact_about_year") do
      assert_equal fact, NumberClient::Year.new(year, notfound: 'ceil', fragment: '').call, 
        "NumberClient::Year.new(#{year}, notfound: 'ceil', fragment: '').call should return a string with ceil fragment fact of the year"
    end
  end

  # http://numbersapi.com/3319/year?notfound=floor
  def test_notfound_floor_fact_about_year
  	year = 3319
    fact = "2059 is the year that Futurist Simon Hopkins predicts the collapse of modern economic systems."

  	VCR.use_cassette("notfound_floor_fact_about_year") do
      assert_equal fact, NumberClient::Year.new(year, notfound: 'floor').call,
        "NumberClient::Year.new(#{year}, notfound: 'floor').call should return a string with floor fact of the year"
    end
  end

  # http://numbersapi.com/3319/year?notfound=floor&fragment=
  def test_notfound_floor_fragment_fact_about_year
  	year = 3319
    fact = "Futurist Simon Hopkins predicts the collapse of modern economic systems"

  	VCR.use_cassette("notfound_floor_fragment_fact_about_year") do
      assert_equal fact, NumberClient::Year.new(year, notfound: 'floor', fragment: '').call,
        "NumberClient::Year.new(#{year}, notfound: 'floor', fragment: '').call should return a string with floor fragment fact of the year"
    end
  end

   # http://numbersapi.com/1234567890987654321/year?default=This+is+test+for+default+fact.
  def test_default_fact_about_year
  	year = 1234567890987654321
    fact = "This is test for default fact."

  	VCR.use_cassette("default_fact_about_year") do
      assert_equal fact, NumberClient::Year.new(year, default: fact).call, 
        "NumberClient::Year.new(#{year}, default: fact).call should return a string with default fact of the year"
    end
  end

  # http://numbersapi.com/aaa/year
  def test_invalid_year
  	year = "aaa"
  	error = "Invalid number"

  	assert_equal error, NumberClient::Year.new(year).call, 
      "NumberClient::Year.new(#{year}).call should return a validation error"
  end
end
