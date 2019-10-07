require 'rails_helper'

RSpec.describe 'Managing short links', type: :request do
  let(:headers) do
    { 'Accept': 'application/json; version=1' }
  end

  describe 'GET /(link_id)' do
    let(:short_link) { create(:short_link) }

    it 'returns the short link if it exists' do
      get "/#{short_link.short_link}", headers: headers
      expect(response.status).to eq 302
      expect(response.redirect_url).to eq short_link.long_url
    end

    it 'returns a 404 if the short link does not exist' do
      get '/foobar', headers: headers
      expect(response.status).to eq 404
      expect(json.dig('message')).to eq 'Short link not found'
    end
  end

  describe 'POST /short_link' do
    let(:submitted_url) { 'https://google.com' }
    let(:post_params) do
      { long_url: submitted_url }
    end

    context 'with a valid URL' do
      it 'should create a short link' do
        post '/short_link', params: post_params, headers: headers
        expect(response).to be_successful
        expect(response).to match_json_schema('short_link')
        expect(json.dig('data', 'attributes', 'long_url')).to eq submitted_url
        expect(json.dig('data', 'attributes', 'short_link')).to eq "http://localhost:3000/#{ShortLink.last.short_link}"
      end
    end

    context 'with an invalid URL' do
      let(:submitted_url) { 'not a valid URL' }

      it 'should not create a short link' do
        post '/short_link', params: post_params, headers: headers
        expect(response.status).to eq 422
        expect(json.dig('errors', 0, 'field')).to eq 'long_url'
        expect(json.dig('errors', 0, 'detail')).to eq 'is not a valid URL'
      end
    end

    context 'when the link already exists' do
      let!(:existing_short_link) do
        create(:short_link, long_url: 'https://google.com')
      end

      it 'returns the existing link without creating a new one' do
        expect do
          post '/short_link', params: post_params, headers: headers
        end.to_not change { ShortLink.count }
      end
    end
  end
end
