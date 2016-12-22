CareerMaps::Application.routes.draw do

  devise_for :users,
    path_names: {
      password: 'forgot',
      registration: 'register',
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'signup'
    }

  namespace 'admin', as: 'admin', path: 'thefuture' do

    resources :jobs, :careers, :pages, :questions,
      :users, except: [:show] do
        get :confirm_destroy, on: :member
        post :search, on: :collection
    end

    root 'admin#index'
  end


  resources :careers do
    get 'search', on: :collection
  end

  resources :jobs, except: [:show,] do
    get 'quiz_filter', on: :collection
    get 'search', on: :collection
  end

  resources :jobs, only: [:show,] do
    resources :education_levels, only: [:filter] do
      match 'filter', on: :collection, via: [:get, :post]
    end
  end


  get "pages/show"
  get ':id', as: :page, to: 'pages#show'

  root 'home#index'

end
