require 'test_helper'
require_relative '../../number_client/date'

class NumberClient::DateTest < Minitest::Test
  # a day of year in the form month/day

  # http://numbersapi.com/random/date
  def test_random_fact
  	fact = "July 27th is the day in 1990 that the Supreme Soviet of the Belarusian Soviet Republic declares independence of Belarus from the Soviet Union."

  	VCR.use_cassette("random_date_call") do
      assert_equal fact, NumberClient::Date.new.call, 
        "NumberClient::Date.new.call should return a string with random fact of the date"
    end
  end

  # http://numbersapi.com/06/06/date
  def test_fact_about_date
  	date = '06/06'
    fact = "June 6th is the day in 1809 that Sweden promulgates a new Constitution, which restores political power to the Riksdag of the Estates after 20 years of Enlightened absolutism."

  	VCR.use_cassette("fact_about_date") do
      assert_equal fact, NumberClient::Date.new(date).call, 
        "NumberClient::Date.new('#{date}').call should return a string with fact of the date"
    end
  end

  # http://numbersapi.com/1/13/date?fragment=
  def test_fragment_fact_about_date
  	date = '1/13'
    fact = "the Treaty of Cahuenga ends the Mexican–American War in California"

  	VCR.use_cassette("fragment_fact_about_date") do
      assert_equal fact, NumberClient::Date.new(date, fragment: '').call, 
        "NumberClient::Date.new('#{date}', fragment: '').call should return a string with fragment fact of the date"
    end
  end

  # http://numbersapi.com/11/11/date?notfound=ceil
  def test_notfound_ceil_fact_about_date
  	date = '11/11'
    fact = "November 11th is the day in 1960 that a military coup against President Ngo Dinh Diem of South Vietnam is crushed."

  	VCR.use_cassette("notfound_ceil_fact_about_date") do
      assert_equal fact, NumberClient::Date.new(date, notfound: 'ceil').call, 
        "NumberClient::Date.new('#{date}', notfound: 'ceil').call should return a string with ceil fact of the date"
    end
  end

  # http://numbersapi.com/05/25/date?notfound=ceil&fragment=
  def test_notfound_ceil_fragment_fact_about_date
  	date = '05/25'
    fact = "the United Kingdom's House of Commons passes the Home Rule Act for devolution in Ireland"

  	VCR.use_cassette("notfound_ceil_fragment_fact_about_date") do
      assert_equal fact, NumberClient::Date.new(date, notfound: 'ceil', fragment: '').call, 
        "NumberClient::Date.new('#{date}', notfound: 'ceil', fragment: '').call should return a string with ceil fragment fact of the date"
    end
  end

  # http://numbersapi.com/8/8/date?notfound=floor
  def test_notfound_floor_fact_about_date
  	date = '8/8'
    fact = "August 8th is the day in 1876 that Thomas Edison receives a patent for his mimeograph."

  	VCR.use_cassette("notfound_floor_fact_about_date") do
      assert_equal fact, NumberClient::Date.new(date, notfound: 'floor').call,
        "NumberClient::Date.new('#{date}', notfound: 'floor').call should return a string with floor fact of the date"
    end
  end

  # http://numbersapi.com/09/9/date?notfound=floor&fragment=
  def test_notfound_floor_fragment_fact_about_date
  	date = '09/9'
    fact = "James IV of Scotland is defeated and dies in the Battle of Flodden Field, ending Scotland's involvement in the War of the League of Cambrai"

  	VCR.use_cassette("notfound_floor_fragment_fact_about_date") do
      assert_equal fact, NumberClient::Date.new(date, notfound: 'floor', fragment: '').call,
        "NumberClient::Date.new('#{date}', notfound: 'floor', fragment: '').call should return a string with floor fragment fact of the date"
    end
  end

  # http://numbersapi.com/13/13/date
  def test_invalid_date
  	date = "13/13"
  	error = "Invalid number"

  	assert_equal error, NumberClient::Date.new(date).call, 
      "NumberClient::Date.new('#{date}').call should return a validation error"
  end
end
