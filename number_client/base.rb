require 'httparty'

module NumberClient
  class Base
  	attr_accessor :number, :options

  	API_ENDPOINT = "http://numbersapi.com/"

    def initialize(number = 'random', **opts)
      @number = number.to_s
      @options = URI.encode_www_form(opts.slice(:fragment, :notfound, :default, :min, :max))
    end

    def call
      return "Invalid number" unless valid?

      puts "call to #{root_path}"
  	  HTTParty.get(root_path).parsed_response
    end

    private

    def type
      self.class.name.split('::').last.downcase
    end

    def root_path
      "#{API_ENDPOINT}#{number}/#{type}?#{options}"
    end

    def valid?
      return true if number == 'random'

      number.match(/^(\+|-)?[0-9]+$/)
    end
  end	
end
