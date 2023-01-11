# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BasketMaterial, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:length) }
    it { should validate_numericality_of(:length).is_greater_than(0) }
  end
  
  it { should belong_to :material }
end


