require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  it { should validate_url_of :long_url }
  it { should validate_presence_of :long_url}

  let(:short_link) { create(:short_link) }

  it 'should set its short link when created' do
    expect(short_link.short_link).to_not be_nil
  end
end
