require 'test_helper'
require_relative '../../number_client/math'

class NumberClient::MathTest < Minitest::Test
  # http://numbersapi.com/random/math
  def test_random_fact
  	fact = "1230 is the number of square-free graphs with 9 vertices."

  	VCR.use_cassette("random_math_call") do
      assert_equal fact, NumberClient::Math.new.call, 
        "NumberClient::Math.new.call should return a string with random fact of the math"
    end
  end

  # http://numbersapi.com/33/math
  def test_fact_about_digit
  	digit = '33'
    fact = "33 is the largest positive integer that cannot be expressed as a sum of different triangular numbers."

  	VCR.use_cassette("fact_about_digit") do
      assert_equal fact, NumberClient::Math.new(digit).call, 
        "NumberClient::Math.new(#{digit}).call should return a string with fact of the digit"
    end
  end

  # http://numbersapi.com/77/math?fragment=
  def test_fragment_fact_about_digit
  	digit = '77'
    fact = "the sum of three squares, 42 + 52 + 62, as well as the sum of the first eight prime numbers"

  	VCR.use_cassette("fragment_fact_about_digit") do
      assert_equal fact, NumberClient::Math.new(digit, fragment: '').call, 
        "NumberClient::Math.new(#{digit}, fragment: '').call should return a string with fragment fact of the digit"
    end
  end

  # http://numbersapi.com/-11331133/math?notfound=ceil
  def test_notfound_ceil_fact_about_digit
  	digit = -11331133
    fact = "0 is the additive identity."

  	VCR.use_cassette("notfound_ceil_fact_about_digit") do
      assert_equal fact, NumberClient::Math.new(digit, notfound: 'ceil').call, 
        "NumberClient::Math.new(#{digit}, notfound: 'ceil').call should return a string with ceil fact of the digit"
    end
  end

  # http://numbersapi.com/-11331133/math?notfound=ceil&fragment=
  def test_notfound_ceil_fragment_fact_about_digit
  	digit = -11331133
    fact = "the additive identity"

  	VCR.use_cassette("notfound_ceil_fragment_fact_about_digit") do
      assert_equal fact, NumberClient::Math.new(digit, notfound: 'ceil', fragment: '').call, 
        "NumberClient::Math.new(#{digit}, notfound: 'ceil', fragment: '').call should return a string with ceil fragment fact of the digit"
    end
  end

  # http://numbersapi.com/113311331133/math?notfound=floor
  def test_notfound_floor_fact_about_digit
  	digit = 113311331133
    fact = "4294967297 is a Fermat number and semiprime. It is the smallest number of the form  which is not a prime number."

  	VCR.use_cassette("notfound_floor_fact_about_digit") do
      assert_equal fact, NumberClient::Math.new(digit, notfound: 'floor').call,
        "NumberClient::Math.new(#{digit}, notfound: 'floor').call should return a string with floor fact of the digit"
    end
  end

  # http://numbersapi.com/113311331133/math?notfound=floor&fragment=
  def test_notfound_floor_fragment_fact_about_digit
  	digit = 113311331133
    fact = "a Fermat number and semiprime. It is the smallest number of the form  which is not a prime number"

  	VCR.use_cassette("notfound_floor_fragment_fact_about_digit") do
      assert_equal fact, NumberClient::Math.new(digit, notfound: 'floor', fragment: '').call,
        "NumberClient::Math.new(#{digit}, notfound: 'floor', fragment: '').call should return a string with floor fragment fact of the digit"
    end
  end

  # http://numbersapi.com/1a1/math
  def test_invalid_math
  	digit = "1a1"
  	error = "Invalid number"

  	assert_equal error, NumberClient::Math.new(digit).call, 
      "NumberClient::Math.new(#{digit}).call should return a validation error"
  end
end
