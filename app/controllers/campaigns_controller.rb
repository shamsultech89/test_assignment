# frozen_string_literal: true

class CampaignsController < ApplicationController
  before_action :authorized

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user = logged_in_user
    if @campaign.save
      render json: @campaign, serializer: CampaignSerializer
    else
      render json: @campaign.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :purpose, :estimated_duration, tag_ids: [])
  end
end
