Rails.application.routes.draw do
  root 'pages#show'

  resources :pages, only: [:show, :create, :update] do
    member do
      get 'clone'
      get 'styles'
    end
  end
end
