SourceBrowser::Engine.routes.draw do
  root "source#index"
  get "*id" => "source#show", as: :browse, format: false, defaults: {format: 'html'}
  get "objects/*id" => "objects#show", as: :object, format: false, defaults: {format: 'html'}
end
