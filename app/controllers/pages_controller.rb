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
    if params[:q].nil?
      @search_results = []
    else
      squatter_id = params[:q]["squatter_id"].to_i
      distance = params[:q]["distance"]
      @search_results = Abode.near(Squatter.find(squatter_id).location, distance)
      @total_results = @search_results.size
    end
  end
end
