Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/about", to: "static_pages#about"
    get "/help", to: "static_pages#help"
    get "/contact",to: "static_pages#contact"
    get "/signup", to: "users#new"
    resources :users
    resources :account_activations, only: %i(edit)
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end
end
