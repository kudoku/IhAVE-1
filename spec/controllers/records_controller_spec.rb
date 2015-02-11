require 'rails_helper'

RSpec.describe RecordsController, :type => :controller do
	let(:user) { create :user }
  let(:location) { create(:location, user: user) }
  let(:item) { create :item, user: user}
  before { sign_in user }

  describe "post #create" do
  	subject {post :create, location_id: item.location_id, item_id: item.id, record:{ date_due: "12-12-2200",
  	 borrower_email:"ihavetest@gmail.com" }}

    it "renders the new page" do
    	expect(subject).to have_http_status(:success)
    end
  end

end
