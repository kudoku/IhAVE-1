require 'rails_helper'

RSpec.describe ItemsController, :type => :controller do

  let(:user) { create :user }
  let(:location) { create(:location, user: user) }
  let(:item) { create :item, user: user}
  before { sign_in user }

  describe "post#create" do

      context 'item is not valid' do
        it 'renders the new page' do
          expect {
            post :create, location_id: location.id, item: { name: '' }
          }.to_not change(Item, :count)
          expect(response).to render_template(:new)
        end
      end

      context 'item is valid ' do
        subject {post :create, location_id: location.id, item: { name: 'name', description: 'hi I am a test' } }

        it 'renders the  location' do
          expect{ subject }.to change(Location, :count).by(1)
          expect(response).to have_http_status(302)
        end
      end

  end

  describe "patch#update" do

    end


  describe "GET #index" do
    subject {get :index, location_id: location.id }

    it "returns http success" do
      expect(subject).to have_http_status(:success)
    end

  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: item.id, location_id: location.id}
      expect(response).to have_http_status(:success)
    end
  end

end
