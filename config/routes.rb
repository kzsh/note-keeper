Rails.application.routes.draw do
  scope('api/v1', defaults: { format: 'json' }) do
    devise_for(:users, skip: :all)
    devise_scope(:user) do
      post 'user/sign_in' => 'devise/sessions#create'
      delete 'user/sign_out' => 'devise/sessions#destroy'

      # create password reset request
      post 'user/password' => 'api/v1/passwords#create'
      # edit password from reset
      patch 'user/password' => 'devise/passwords#update'
      put 'user/password' => 'devise/passwords#update'

      # create a confirmation (param confirmation_token)
      put 'user/confirmation' => 'api/v1/confirmations#show'

      # send a confirmation email
      post 'user/confirmation' => 'api/v1/confirmations#create'

      # view current logged in user
      get 'user' => 'api/v1/registrations#show'
      # create a user via register
      post 'user' => 'api/v1/registrations#create'
      # edit thyself, requires login (change password)
      patch 'user' => 'devise/registrations#update'
      put 'user' => 'devise/registrations#update'
    end
    scope(module: 'api/v1') do
      resources :notes, only: [:index]
    end
  end

  scope('/', defaults: { format: 'json' }) do
    use_doorkeeper
  end

  root('home#index')
end
