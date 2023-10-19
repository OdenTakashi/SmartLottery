Rails.application.routes.draw do
  root 'welcome#index'
  get 'privacy_policy', to: 'welcome#privacy_policy', as: :privacy_policy
  get 'terms', to: 'welcome#terms', as: :terms

  resources :welcome, only: (:index)

  resources :lotteries do
    resources :entries, only: [:new, :create]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
