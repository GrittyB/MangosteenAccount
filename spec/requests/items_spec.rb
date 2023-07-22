require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "index by page" do 
    it "returns items by page" do
      11.times { Item.create(amount: 10) }
      expect(Item.count).to eq(11)
      get "/api/v1/items"
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body) 
      expect(json["resources"].length).to eq(10)
      get '/api/v1/items?page=2'
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json["resources"].length).to eq(1)
    end
  end
  describe "create" do
    it "creates an item" do
      expect{
        post '/api/v1/items', params: { amount: 10 }
      }.to change{ Item.count }.by(1)
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['resource']['id']).not_to be_nil
      expect(json['resource']['amount']).to eq(10)
    end
  end
end
