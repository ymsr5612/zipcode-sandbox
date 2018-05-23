Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'yubins/:id', to: 'yubin#search'
    end
    namespace :v2 do
      get 'yubins/:id', to: 'yubin#search'
    end
  end
end
