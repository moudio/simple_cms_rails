Rails.application.routes.draw do
  get 'sections/index'
  get 'sections/edit'
  get 'sections/show'
  get 'sections/delete'
  get 'pages/index'
  get 'pages/show'
  get 'pages/edit'
  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'
  root 'demo#index'
  resources :subjects do
    member do
      get :delete
    end
  end
  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end 
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
