# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :authorized

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: @tag
    else
      render json: @tag.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, sub_tags_attributes: [:name])
  end
end
