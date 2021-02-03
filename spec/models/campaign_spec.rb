# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:purpose) }
    it { should validate_presence_of(:estimated_duration) }
    it do
      should validate_inclusion_of(:estimated_duration).in_array(
        %w[within_1_week within_1_month within_3_months]
      )
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:campaign_tags) }
    it { should have_many(:tags) }
    it { should have_many(:sub_tags) }
    it { should have_many(:comments) }
  end
end
