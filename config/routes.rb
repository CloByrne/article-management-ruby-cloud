#Set up of routes for the applications controllers and views

Rails.application.routes.draw do
  resources :articles
# Route all requests that do not match existing routes to React app
  get '*path', to: 'client#index', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
