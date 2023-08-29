Rails.application.routes.draw do
  root 'lotteries#index'
  get 'welcome', to: 'welcome#index'
  get 'about_anonymous_deliver', to: 'welcome#about_anonymous_deliver', as: 'about_anonymous_deliver'
  resources :lotteries do
    resources :entries, only: [:new, :create]
  end
  resources :prizes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
