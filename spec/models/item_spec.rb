require 'rails_helper'

RSpec.describe Item, :type => :model do
  let(:location) { create(:location) }
  let(:user) { create :user }
  let(:item) {create :item}
  it 'is not valid without a name' do
      item = Item.new
      item.should_not be_valid
  end

  it 'belongs to a location' do
    item = Item.new
    item.should_not be_valid
  end
  end
