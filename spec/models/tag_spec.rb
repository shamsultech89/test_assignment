# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Associations' do
    it { should have_many(:sub_tags) }
  end

  describe 'Nested attributes' do
    it { should accept_nested_attributes_for(:sub_tags) }
  end
end
