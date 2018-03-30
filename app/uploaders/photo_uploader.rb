class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true

  version :color do
    process :crop => [0.5, 0.5, :center]
  end

end
