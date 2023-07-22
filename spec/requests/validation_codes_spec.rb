require 'rails_helper'

RSpec.describe "ValidationCodes", type: :request do
  describe "GET /validation_codes" do
    it "works! (now write some real specs)" do
      get validation_codes_index_path
      expect(response).to have_http_status(200)
    end
  end
end
