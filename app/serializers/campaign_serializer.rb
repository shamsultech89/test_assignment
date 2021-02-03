# frozen_string_literal: true

class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :title, :purpose, :estimated_duration, :user_id
end
