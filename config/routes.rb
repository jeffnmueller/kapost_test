Rails.application.routes.draw do
  api_version(module: 'V1', header: { name: 'Accept', value: 'application/vnd.kapost.com; version=1' }, path: { :value => 'v1' }, default: true) do
    resources :short_links, only: %i(create show)
  end
end
