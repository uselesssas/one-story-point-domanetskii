require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { should belong_to(:author) }
  end

  describe 'validations' do
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(2).is_at_most(200) }
  end
end
