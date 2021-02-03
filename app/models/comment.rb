# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :content, :user_id, presence: true

  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
