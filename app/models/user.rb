# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  validate :image_type

  def image_type
    if image.attached?
      unless image.blob.content_type.in?(%(image/jpeg image/png image/gif))
        errors.add(:image, 'はjpeg・png・gif形式のいずれかでアップロードしてください')
      end
    end
  end

end
