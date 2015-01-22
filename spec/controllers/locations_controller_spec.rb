require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do

  # location = FactoryGirl.new :location
  let(:location) { create(:location) }
  let(:user) { create :user } 
  before { sign_in user }

  # describe "GET #show" do

    it "assigns requested location to @location" do
      location = create(:location)
      get :show, id: location
      expect(assigns(:location)).to eq location
    end


    it "returns http success" do
      location = create(:location)
      get :show, id: location.id
      expect(response).to have_http_status(:success)
    end
    
  # end


  describe "Patch #update" do
    before :each do
      @location = create(:location,
                          name: 'dpl', 
                          description: 'the best')
    end

    context "valid attributes" do
      it "locates the requested @location" do
        patch :update, id: @location, location: attributes_for(:location)
        expect(assigns(:location)).to eq(@location)
      end

      it "updates @location attributes" do
        patch :update, id: @location,
          location: attributes_for(:location,
                                  name: 'home',
                                  description: 'home sweet home')
        @location.reload
        expect(@location.name).to eq('home')
        expect(@location.description).to eq('home sweet home')
      end
    end

  end 

end
