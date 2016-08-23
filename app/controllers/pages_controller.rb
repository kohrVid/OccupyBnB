class PagesController < ApplicationController
  def index
  end

  def help
  end

  def privacy
  end

  def tos
  end

  def search
    @squatter_search_results = []
    if params[:q].nil?
      @search_results = []
    else
#      squatter_id = params[:q]["squatter_id"].to_i
      @search_results = Abode.search(params[:q]).approved
      @total_results = @search_results.count
    end
  end
  
  def squatter_search
    @search_results = []
    if params[:search_username].nil?
      @squatter_search_results = []
    else
      @squatter_search_results = Squatter.search(params[:search_username])
      @total_sqatters = @squatter_search_results.count
    end
  end
end
