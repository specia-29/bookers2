Rails.application.routes.draw do
    devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # login/sign_inへのカスタムパス
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # sign_up/registrationへのカスタムパス
  end

  devise_for :users
  root to: 'homes#top'
  get 'books' => 'books#index'
  get 'home/about' => 'homes#about'
  post 'books' => 'books#create'


  resources :books, only: [:new, :create, :index, :show]

  resources :users, only: [:show, :edit, :update]

end
