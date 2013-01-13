class Image < ActiveRecord::Base
  attr_accessible :description, :title, :image_object
  belongs_to :image_reference, polymorphic: true
  has_attached_file :image_object,
    :styles => { :portrait => "300X600", :thumb => "75x75>" },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml", 
    :path => ":class/:attachment/:id-:basename-:style.:extension"
    #:bucket => "natures-plate-dev",
    #:s3_permissions => :private

  validates_attachment_presence :image_object
  validates_attachment_size :image_object, :less_than => 5.megabytes
  validates_attachment_content_type :image_object, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
