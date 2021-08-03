# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  validate :image_type

  def image_type
    errors.add(:image, 'はjpeg・png・gif形式のいずれかでアップロードしてください') if image.attached? && !image.blob.content_type.in?(%(image/jpeg image/png image/gif))
  end
end
