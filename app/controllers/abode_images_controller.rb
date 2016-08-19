class AbodeImagesController < ApplicationController
  before_action :authenticate_squatter!
  def create
    @abode_image = AbodeImage.create(abode_image_params)
  end

  private
    def abode_image_params
      params.require(:abode_image).permit(:file_name, :abode_id)
    end
end
