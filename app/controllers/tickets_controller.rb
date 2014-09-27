class TicketsController < ApplicationController
  before_action :set_ticket, :except => [:create, :new, :index]
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
  respond_to :html, :json, :xml

  def index
    @tickets = Ticket.all
    respond_with @tickets
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    respond_with @ticket, notice: 'Ticket was successfully created.' if @ticket.save
  end

  def update
    @ticket.update_attributes(ticket_params)
    respond_with @ticket
  end

  def edit_status
    render 'tickets/edit_status', layout: false
  end

  def update_status
    @ticket.update_attributes(params[:status][:department])
  end

  def destroy
    @ticket.destroy
    respond_with @tickets, location: tickets_path, notice: 'Ticket was successfully destroyed.'
  end

  private
    def set_ticket
      @ticket = Ticket.find_by_identifier(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:title, :description, :customer_name, :department, :customer_email, :status)
    end
end
