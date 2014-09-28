require 'spec_helper'

describe Ticket do
  context "create_ticket" do    
    subject { Ticket.new(title: "title1")}

    it { should validate_presence_of :title }  
  end 
  
  context "default values" do      
    let(:ticket) { Ticket.new(title: "title2") }

    it "should have default status" do
      expect(ticket.status).to eq("wait_for_staff_response")
    end
    it "identifier should match pattern" do
      ticket.save
      ticket.identifier.should match(/\A([A-Z]{3}+\-)|([A-Z0-9]{2}+\-)|([A-Z]{3})|([A-Z0-9]{2}+\-)|([A-Z]{3})/)
    end
  end
end