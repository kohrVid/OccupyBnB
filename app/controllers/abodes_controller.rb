class AbodesController < ApplicationController
  before_action :authenticate_squatter!
  def index
    @abodes = Abode.approved
  end
end
