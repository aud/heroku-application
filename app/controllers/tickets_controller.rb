class TicketsController < ApplicationController
  def new
  end

  def create
    @requester_name = params[:requester_name]
    @email = params[:email]
    @ticket = ticket_params

    render 'create', layout: false
  end

  def index_and_search
    @id = params[:id]
    if @id
      @hello = client.requests.find(id: @id)
    end

    render 'index_and_search', layout: false
  end

  def show
    @comments = client.requests.find(id: params[:id]).comments
    render 'show', layout: false
  end

  def update
    @id = params[:id]
    @comment = params[:comment]

    @update = client.requests.find(id: @id)
    @update.comment = { body: @comment}
    @update.save

    redirect_to ticket_path(@id)
  end

  private

  def ticket_params
    options_params = { subject: params[:subject], comment: { value: params[:body] }, requester: { email: @email } }
    options_params[:requester][:name] = params[:requester_name]

    ZendeskAPI::Ticket.create(client, options_params)
  end
end
