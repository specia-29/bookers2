Rails.application.routes.draw do
    devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # login/sign_inへのカスタムパス
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # sign_up/registrationへのカスタムパス
  end

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :books

  resources :users

end
