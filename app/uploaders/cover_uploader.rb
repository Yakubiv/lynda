# encoding: utf-8

class CoverUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  version :thumb do
    process :resize_to_fill => [200,200]
  end

  version :small_thumb, :from_version => :thumb do
    process resize_to_fill: [50, 50]
  end

end
