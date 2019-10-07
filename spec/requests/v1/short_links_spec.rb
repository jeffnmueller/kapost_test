require 'rails_helper'

RSpec.describe 'Managing short links', type: :request do
  let(:headers) do
    { 'Accept': 'application/vnd.kapost.com; version=1' }
  end

  describe 'GET /v1/short_links/(link_id)' do
    let(:short_link) { create(:short_link) }

    it 'returns the short link if it exists' do
      get "/v1/short_links/#{short_link.short_url}", headers: headers
      expect(response).to be_successful
      expect(json.dig('short_url')).to eq short_link.short_url
      expect(json.dig('url')).to eq short_link.url
    end

    it 'returns a 404 if the short link does not exist' do
      get '/v1/short_links/foobar', headers: headers
      expect(response.status).to eq 404
      expect(json.dig('message')).to eq 'Short link not found'
    end
  end

  describe 'POST /v1/short_links' do
    context 'with a valid URL' do
      let(:submitted_url) { 'https://google.com' }

      it 'should create a short link' do
        post '/v1/short_links',
          params: {
          short_link: {
            url: submitted_url
          }
        }, headers: headers
        expect(response).to be_successful
        expect(json.dig('url')).to eq submitted_url
      end
    end

    context 'with an invalid URL' do
      let(:submitted_url) { 'not a valid URL' }

      it 'should not create a short link' do
        post '/v1/short_links',
          params: {
          short_link: {
            url: submitted_url
          }
        }, headers: headers
        expect(response.status).to eq 422
        expect(json.dig('url')[0]).to eq 'is not a valid URL'
      end
    end
  end
end
