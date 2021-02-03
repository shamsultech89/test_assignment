# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CampaignTag, type: :model do
  describe 'Associations' do
    it { should belong_to(:campaign) }
    it { should belong_to(:tag) }
    it { should have_many(:sub_tags) }
  end
end
