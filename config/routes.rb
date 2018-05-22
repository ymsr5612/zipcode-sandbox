Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'yubins/:id', to: 'yubin#search'
    end
    namespace :v2 do
      get 'yubins/:id', to: 'yubin#search'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
