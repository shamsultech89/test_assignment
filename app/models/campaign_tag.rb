# frozen_string_literal: true

class CampaignTag < ApplicationRecord
  belongs_to :campaign
  belongs_to :tag
  has_many :sub_tags, through: :tag, source: :sub_tags
end
