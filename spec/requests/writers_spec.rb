require 'rails_helper'

RSpec.describe "Writers", type: :request do
  describe "GET /writers" do
    it "should work" do
      get "/writers"
      # puts response.inspect
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe "POST /writers" do
    it "return the error message for bio not given." do
      post "/writers", :params => { :writer => {:name => "Writer1"} }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
      expect(response.body).to include("bio")
      expect(response.body).to include("过短")
    end

    it "created the writer" do
      post "/writers", :params => { :writer => {:name => "Writer2", bio: 'biobiobio2bio'} }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/writers')
    end
  end
end
