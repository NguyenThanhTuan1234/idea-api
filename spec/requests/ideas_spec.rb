require 'rails_helper'

RSpec.describe "Ideas", type: :request do
  let!(:category) { create(:category) }
  let!(:ideas) { create_list(:idea, 20, Category_id: category.id) }
  let(:category_id) { category.id }
  describe "GET /ideas" do
    before { get '/ideas' }
    it "returns ideas" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
      it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
end
