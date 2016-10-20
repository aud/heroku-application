class TicketsController < ApplicationController
  def new
  end

  def show
  end

  def destroy
    client.ticket.destroy!(id: params[:id])
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def create
    @ticket = ticket_params
    @requester_name = params[:requester_name]
    @comment = client.requests.find(id: @ticket.id).comments
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index_and_search
    @id = params[:id]
    @comments = client.requests.find(id: @id).comments
    if client.requests.find(id: @id)
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def update
    @id = params[:id]
    @comments = client.requests.find(id: @id).comments
    @comment = params[:comment]

    update = client.requests.find(id: @id) if @id
    update.comment = { body: @comment }
    if update.save
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def ticket_params
    options_params = { subject: params[:subject], comment: { value: params[:body] }, requester: { email: @email } }
    options_params[:requester][:name] = params[:requester_name]

    ZendeskAPI::Ticket.create(client, options_params)
  end
end
