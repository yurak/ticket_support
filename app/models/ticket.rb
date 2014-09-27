class Ticket < ActiveRecord::Base
	extend FriendlyId
	include Ticket::Identifier

	enum status: [:wait_for_staff_response, :wait_for_customer, :on_hold, :cancelled, :completed]
 	enum department: [:development, :design, :configuration]	
	has_many :comments

  friendly_id :identifier
end
