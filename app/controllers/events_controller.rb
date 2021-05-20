class EventsController < ApplicationController
  skip_before_action :keep_out_unless_logged_in
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    update_events_hash
    render_or_redirect
    @sort_key = sort_key
    @events = Event.sort_events(@sort_key)
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params[:event]
    end
    
    def sort_key
      session[:sort]
    end
    def update_events_hash
      session[:sort] = params[:sort] || session[:sort] || :id
    end
    
    def render_or_redirect
      return unless (session[:sort] and params[:sort].nil?)
      redirect_to events_path(:sort => session[:sort])
    end
end
