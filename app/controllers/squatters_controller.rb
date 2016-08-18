class SquattersController < ApplicationController
  before_action :authenticate_squatter!
  def index
  end

  def show
    @squatter = Squatter.find(params[:id])
  end
end
