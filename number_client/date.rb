module NumberClient
  class Date < Base
	private

	def valid?
	  return true if number == 'random'

	  number.match(/^(0?\d{1}|1[0-2])\/([0-2]?\d{1}|3[0-1])$/)
	end
  end
end
