# frozen_string_literal: true

class DiscussionTopic < ApplicationRecord
  validates :title, :campaign_id, :user_id, presence: true
  validates :campaign_id, uniqueness: {
    scope: :user_id,
    message: 'Users can create at most one topic for discussion per campaign.'
  }

  belongs_to :campaign
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :nullify
end
