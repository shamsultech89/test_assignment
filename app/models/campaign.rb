# frozen_string_literal: true

class Campaign < ApplicationRecord
  ESTIMATED_DURATION = %w[within_1_week within_1_month within_3_months].freeze

  validates :title, :purpose, :estimated_duration, presence: true
  validates :estimated_duration, inclusion: { in: ESTIMATED_DURATION }

  belongs_to :user
  has_many :campaign_tags, dependent: :destroy
  has_many :tags, -> { where(tag_id: nil) }, through: :campaign_tags
  has_many :sub_tags, through: :campaign_tags
  has_many :comments, as: :commentable, dependent: :nullify
end
