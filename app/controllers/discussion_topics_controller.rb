# frozen_string_literal: true

class DiscussionTopicsController < ApplicationController
  before_action :authorized

  def create
    @discussion_topic = DiscussionTopic.new(discussion_topic_params)
    @discussion_topic.user = logged_in_user
    if @discussion_topic.save
      render json: @discussion_topic
    else
      render json: @discussion_topic.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def discussion_topic_params
    params.require(:discussion_topic).permit(:title, :campaign_id)
  end
end
