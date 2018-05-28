Rails.application.routes.draw do
  get 'savings/index'
  get 'tasks/index'
  get 'tasks/uncheck'
  get 'publics/index'
  devise_scope :user do 
  	authenticated :user do
  		resources :tasks
  		resources :savings
  		# resources :outflows
  		root 'tasks#index', as: :authenticated_user_root
  	end
  end
  devise_for :users
  root 'publics#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
