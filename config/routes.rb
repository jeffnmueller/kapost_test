Rails.application.routes.draw do
  api_version(module: 'V1', header: { name: 'Accept', value: 'application/json; version=1' }, path: { :value => 'v1' }, default: true) do
    post 'short_link', controller: 'short_links', action: :create
    get '/:id', controller: :short_links, action: :show
  end
end
