# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Material, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:thickness) }
    it { should validate_presence_of(:width) }
  end

  it { is_expected.to monetize(:price).allow_nil }
  it { should have_one(:favourite) }
end
