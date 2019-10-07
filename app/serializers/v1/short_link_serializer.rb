class V1::ShortLinkSerializer < V1::ApplicationSerializer
  attributes :id, :long_url, :short_link, :created_at, :updated_at

  def short_link
    "#{root_url}#{object.short_link}"
  end
end
