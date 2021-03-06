Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users, only: [:show, :edit, :update, :destroy]
  resources :posts, only: %i(new index create show) do
    collection do
      post :confirm
    end
    resources :photos, only: %i(create)
  end

end
