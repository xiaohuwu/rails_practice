Rails.application.routes.draw do

    resources :orders


    # Authentication
    resources :users

    # General

    # Resources
    resources :products do
        resources :variants, shallow: true
        collection do
            get :top
        end
        member do
            post :buy
        end
    end

    resources :orders

    get "/cart", to: 'checkout#cart', as: :cart
    post "/checkout", to: 'checkout#checkout', as: :checkout
    get "/address", to: 'checkout#address', as: :address
    patch "/confirm", to: 'checkout#confirm', as: :confirm
    post "/:number/pay", to: 'checkout#pay', as: :pay
    get "/:number/notify", to: 'checkout#notify', as: :notify

    # Profile
    resource :profile, only: [:show, :edit, :update]

    # Admin
    namespace :admin do
        root "home#index"
        resources :products do
            resources :variants
        end
    end

    # Comments
    concern :commentable do
        resources :comments
    end

    resources :messages, concerns: :commentable
    resources :articles, concerns: :commentable


    # Root
    root 'products#index'

    resources :events do
        resources :attendees, :controller => 'event_attendees'
        resource :location, :controller => 'event_locations'
        collection do
            post :bulk_update
        end

        member do
            post :join
            post :withdraw
        end

    end



end
