require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  it { should validate_url_of :url }
  it { should validate_presence_of :url}

  let(:short_link) { create(:short_link) }

  it 'should set its short URL when created' do
    expect(short_link.short_url).to_not be_nil
  end
end
