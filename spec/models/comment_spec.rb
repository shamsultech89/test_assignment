# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:commentable) }
  end
end
