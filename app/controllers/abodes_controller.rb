class AbodesController < ApplicationController
  #before_action :authenticate_squatter!
  def index
    @abodes = Abode.all
  end
end
