# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DiscussionTopic, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:campaign_id) }
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:campaign) }
    it { should have_many(:comments) }
  end
end
