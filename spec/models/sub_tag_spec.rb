# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubTag, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Associations' do
    it { should belong_to(:tag) }
  end
end
