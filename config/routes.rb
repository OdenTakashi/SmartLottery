Rails.application.routes.draw do
  resources :entries
  resources :prizes
  root 'lotteries#index'
  resources :lotteries
  get "welcome", to: "welcome#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
