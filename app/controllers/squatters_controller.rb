class SquattersController < ApplicationController
  before_action :authenticate_squatter!
  before_action :find_squatter, only: [:show, :submissions_pending_approval]
  
  def index
  end

  def show
  end

  def submissions_pending_approval
    @pending_abodes = @squatter.submitted_abodes
  end

  private
    def find_squatter
      @squatter = Squatter.find(params[:id])
    end
end
