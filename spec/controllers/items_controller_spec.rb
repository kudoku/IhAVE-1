require 'rails_helper'

RSpec.describe ItemsController, :type => :controller do

  let(:user) { create :user }
  let(:location) { create(:location, user: user) }
  let(:item) { create :item, user: user}
  before { sign_in user }

  describe "post#create" do

      context 'item is not valid' do
       subject {post :create, location_id: location.id, item: { name: '' }}
        it 'renders the new page' do
          expect { subject }.to_not change(Item, :count)
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

    context 'Item update is valid' do
      subject {}
      it 'redirects to the location show page' do
        params = {id: item.id, location_id: location.id, item: { name: "name", description: 'hi I am a test' } }

        expect(
          put :update, params
        ).to have_http_status(302)
      end

    end
      context 'Item update is invalid' do
        subject {patch :update, id: item.id, location_id: location.id, item: { name: nil, description: 'hi I am a test' }}
        it 'renders the edit page' do
          expect(subject).to render_template(:edit)
        end

    end


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
