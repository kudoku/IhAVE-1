require 'rails_helper'

RSpec.describe Item, :type => :model do
  let(:location) { create(:location) }
  let(:user) { create :user }
  let(:item) {create :item}
  it 'is not valid without a name' do
    expect(Item.new).not_to be_valid
  end

  xit 'belongs to a location' do

  end
end
