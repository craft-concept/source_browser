SourceBrowser::Engine.routes.draw do
  # resources :objects, only: :show

  get "objects/*id" => "objects#show", as: :object, format: false
end
