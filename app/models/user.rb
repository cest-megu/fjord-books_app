# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :follow_relationships, dependent: :destroy
  has_many :followings, through: :follow_relationships, source: :follow
  has_many :passive_follow_relationships, class_name: 'FollowRelationship', foreign_key: 'follow_id', dependent: :destroy, inverse_of: :user
  has_many :followers, through: :passive_follow_relationships, source: :user

  def follow(other_user)
    follow_relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    follow_relationship = follow_relationships.find_by(follow_id: other_user.id)
    follow_relationship&.destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end
end
