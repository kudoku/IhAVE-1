require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do

  let(:user) { create :user }
  let(:location) { create(:location, user: user) }
  let(:item) { create :item, user: user}
  before { sign_in user }

    describe "post#create" do

      context 'location is not valid' do
        subject {post :create, location: { name: '', description: 'hi I am a test' } }

        it 'renders the new page' do
          current_user = user
          expect { subject }.to_not change(Location, :count)
          expect(response).to render_template(:new)
        end
      end

      context 'item is valid ' do
        subject {post :create, location: { name: 'name', description: 'hi I am a test' } }

        it 'renders the  location' do
          expect{ subject }.to change(Location, :count).by(1)
          expect(response).to have_http_status(302)
        end
      end
    end

  describe "get#index" do
    it "displays the index page"do
      get :index
      expect(subject).to render_template(:index)
    end
  end

  describe "get#new" do
    it "displays the new page"do
     get :new
      expect(response).to render_template(:new)
    end
  end



  end



