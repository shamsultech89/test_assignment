# frozen_string_literal: true

class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :sub_tags, dependent: :destroy
  accepts_nested_attributes_for :sub_tags
end
