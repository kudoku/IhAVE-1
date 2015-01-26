require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do
  let(:user) { create :user }

  describe "get#home" do

    context "user is loged in" do
      before { sign_in user }
       it "redirects to the users locations page"do
         expect(get :home).to have_http_status(302)
       end
    end
  end

  end

