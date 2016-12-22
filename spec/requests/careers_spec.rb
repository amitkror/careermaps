require 'rails_helper'

RSpec.describe "Careers", :type => :request do
  describe "GET /careers" do
    it "works! (now write some real specs)" do
      get careers_path
      expect(response.status).to be(200)
    end
  end
end
