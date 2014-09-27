class Ticket
	module Identifier
    extend ActiveSupport::Concern
		included { before_create :create_identifier! }

	  def create_identifier!
	    self.identifier = loop do
	      break random_identifier unless self.class.exists?(identifier: random_identifier)
	    end
	  end

	  private

	  def random_identifier(separator = '-')
	    ref = ('A'..'Z').to_a.shuffle().first(3).join('')
	    [ref,SecureRandom.hex(1),ref,SecureRandom.hex(1),ref].join(separator)
	  end
	end
end
