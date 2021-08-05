class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  def ensure_user?(logined_user)
    user == logined_user
  end
end
