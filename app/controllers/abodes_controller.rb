class AbodesController < ApplicationController
  before_action :authenticate_squatter!
  def index
    @abodes = Abode.approved
  end

  def new
    @abode = Abode.new
    @abode.abode_images.build
  end

  def create
    @abode = Abode.create(abode_params)
    if @abode.save
      flash[:notice] = t("abode.new.success")
      redirect_to submissions_pending_approval_squatter_path(@abode.submitted_by)
    else
      flash[:alert] = t("abode.new.error")
      render :new
    end
  end

  def show
    @abode = Abode.find(params[:id])
  end

  private
    def abode_params
      params.require(:abode).permit(:title, :location, :description,
				    :residential, :submitted_by_id, :sleeps_number,
				    :approved, :approved_by_id, :approved_at,
				    abode_images_attributes: [:id, :file_name]
				   )
    end
end
