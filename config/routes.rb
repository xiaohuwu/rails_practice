Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :users
  resources :sessions  do
      collection do
          delete 'logout'
      end
  end
end
