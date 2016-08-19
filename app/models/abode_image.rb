class AbodeImage < ApplicationRecord
  belongs_to :abode
  mount_uploader :file_name, AbodeImagesUploader, s3_protocol: :https
end
