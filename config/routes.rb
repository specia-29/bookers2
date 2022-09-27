Rails.application.routes.draw do
    devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # login/sign_inへのカスタムパス
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # sign_up/registrationへのカスタムパス
  end

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  post 'books' => 'books#create'
  get 'users' => 'users#index'
  get '/users/:id', to: 'users#show'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'


  resources :books, only: [:create, :index, :show, :edit]

  resources :users, only: [:show, :edit, :update]

end
