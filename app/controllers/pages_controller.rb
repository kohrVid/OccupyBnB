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
      @search_results = Abode.approved.search(params[:q])
      @total_results = @search_results.size
    end
  end
end
