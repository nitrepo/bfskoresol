module Refinery
  class SearchController < ::ApplicationController

  	# Display search results given the query supplied
    def show
      @results = Refinery::SearchEngine.search(params[:query], params[:page])

      present(@page = Refinery::Page.find_by_link_url("/search"))
       @blog_posts = Refinery::Blog::Post.live.limit(5)
       @category = Refinery::Blog::Category
    end

  end
end
