require 'test_helper'
require_relative '../../number_client/trivia'

class NumberClient::TriviaTest < Minitest::Test
  # http://numbersapi.com/random/trivia
  def test_random_fact
  	fact = "2701 is a plot triviality in Neal Stephenson's \"Cryptonomicon\"."

  	VCR.use_cassette("random_trivia_call") do
      assert_equal fact, NumberClient::Trivia.new.call, 
        "NumberClient::Trivia.new.call should return a string with random trivia fact by the digit"
    end
  end

  # http://numbersapi.com/313/trivia
  def test_trivia_fact_by_digit
  	digit = '313'
    fact = "313 is the number of Muslims who fought in the Battle of Badr against Muhammad's, and by extension, Islam's, foes."

  	VCR.use_cassette("trivia_fact_by_digit") do
      assert_equal fact, NumberClient::Trivia.new(digit).call, 
        "NumberClient::Trivia.new(#{digit}).call should return a string with trivia fact by the digit"
    end
  end

  # http://numbersapi.com/555/trivia?fragment=
  def test_fragment_trivia_fact_by_digit
  	digit = 555
    fact = "the number of keyboard sonatas written by Domenico Scarlatti, according to the catalog by Ralph Kirkpatrick"

  	VCR.use_cassette("fragment_trivia_fact_by_digit") do
      assert_equal fact, NumberClient::Trivia.new(digit, fragment: '').call, 
        "NumberClient::Trivia.new(#{digit}, fragment: '').call should return a string with fragment trivia fact by the digit"
    end
  end

  # http://numbersapi.com/-157/trivia?notfound=ceil
  def test_notfound_ceil_trivia_fact_by_digit
  	digit = -157
    fact = "0 is the coldest possible temperature old the Kelvin scale."

  	VCR.use_cassette("notfound_ceil_trivia_fact_by_digit") do
      assert_equal fact, NumberClient::Trivia.new(digit, notfound: 'ceil').call, 
        "NumberClient::Trivia.new(#{digit}, notfound: 'ceil').call should return a string with ceil trivia fact by the digit"
    end
  end

  # http://numbersapi.com/-11331133/trivia?notfound=ceil&fragment=
  def test_notfound_ceil_fragment_trivia_fact_by_digit
  	digit = -11331133
    fact = "the atomic number of the theoretical element tetraneutron"

  	VCR.use_cassette("notfound_ceil_fragment_trivia_fact_by_digit") do
      assert_equal fact, NumberClient::Trivia.new(digit, notfound: 'ceil', fragment: '').call, 
        "NumberClient::Trivia.new(#{digit}, notfound: 'ceil', fragment: '').call should return a string with ceil fragment trivia fact by the digit"
    end
  end

  # http://numbersapi.com/113311331133/trivia?notfound=floor
  def test_notfound_floor_trvia_fact_by_digit
  	digit = 113311331133
    fact = "106000000000 is the number of homo sapiens that have lived since speciation."

  	VCR.use_cassette("notfound_floor_trvia_fact_by_digit") do
      assert_equal fact, NumberClient::Trivia.new(digit, notfound: 'floor').call,
        "NumberClient::Trivia.new(#{digit}, notfound: 'floor').call should return a string with floor trivia fact by the digit"
    end
  end

  # http://numbersapi.com/113311331133/trivia?notfound=floor&fragment=
  def test_notfound_floor_fragment_trivia_fact_by_digit
  	digit = 113311331133
    fact = "the number of homo sapiens that have lived since speciation"

  	VCR.use_cassette("notfound_floor_fragment_trivia_fact_by_digit") do
      assert_equal fact, NumberClient::Trivia.new(digit, notfound: 'floor', fragment: '').call,
        "NumberClient::Trivia.new(#{digit}, notfound: 'floor', fragment: '').call should return a string with floor fragment trivia fact by the digit"
    end
  end

  # http://numbersapi.com/1a1/trivia
  def test_invalid_trivia
  	digit = "A1"
  	error = "Invalid number"

  	assert_equal error, NumberClient::Trivia.new(digit).call, 
      "NumberClient::Trivia.new(#{digit}).call should return a validation error"
  end
end
