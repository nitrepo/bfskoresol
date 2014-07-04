module Refinery
  module Calendar
    class VenuesController < ::ApplicationController
    	def index
    		puts "*******in index action *******************"

    		@venues = Venue.all
    	end

    	def show
    		puts "*************** show ************"
    		puts params[:id]
    		puts "**********************************"
    		@venue = Venue.find(params[:id])
    		@venues = Venue.all
       	end
    end
  end
end
