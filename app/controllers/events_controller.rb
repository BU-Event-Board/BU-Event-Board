require 'json'
require 'httparty'
require 'twitter'

class EventsController < ApplicationController
  skip_before_action :keep_out_unless_logged_in
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    update_events_hash
    render_or_redirect
    @sort_key = sort_key
    @query_key = query_key
    @events = Event.search_description(@query_key, @sort_key)
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
     @eventslist = []
    #@event = Event.new(event_params)
     Event.all.each do |e|
         Event.delete(e)
     end
      
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "dnVoYfol2rDJn6JKx7O9z8jfy" 
      config.consumer_secret     = "KnrWrRThpdC6VzEDY7UerusXLTf7rxqVSLHcvi7cu4cYkq8RJQ"
    end

    @Tweets = client.user_timeline('binghamtonu', count: 3200)
    #Tweets.each { |tweet| puts tweet.full_text }

    @Tweets.each do  |tweet|
      if tweet.full_text =~ /(a\.m\.|p\.m\.)/
        @eventslist.push(Event.new({:description => tweet.full_text,:date => tweet.created_at})) 
        p tweet.full_text
      end
    end 
      
    @eventslist.each do |x|
      x.save
    end
      
    if @eventslist[0].save
      redirect_to @eventslist[0], notice: 'Event was successfully created.'
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
    
    def query_key
      session[:query]
    end
    
    def update_events_hash
      session[:sort] = params[:sort] || session[:sort] || :id
      session[:query] = params[:query] || session[:query]
    end
    
    def render_or_redirect
      return unless (session[:sort] and params[:sort].nil? or session[:query] and params[:query].nil?)
      redirect_to events_path(:sort => session[:sort], :query => session[:query])
    end
end
