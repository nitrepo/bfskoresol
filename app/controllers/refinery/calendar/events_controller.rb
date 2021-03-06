module Refinery
  module Calendar
    class EventsController < ::ApplicationController
      def index

        puts "***************in index *************"
        @events = Event.all

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        present(@page)
      end

      def show
        puts "******** in show*************"
        puts params[:id]
        puts "*****************************"
        @event = Event.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        present(@page)
      end

      def archive
        @events = Event.archive.order('refinery_calendar_events.from DESC')
        render :template => 'refinery/calendar/events/index'
      end

      protected
      def find_page
        @page = ::Refinery::Page.where(:link_url => "/connect/events").first
      end

    end
  end
end
