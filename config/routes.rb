Rails.application.routes.draw do
	get 'publics/index'
	devise_scope :user do
		authenticated :user do
			resources :tasks
			get 'homes/index'
			root 'homes#index', as: :authenticated_user_root
		end
	end
	devise_for :users
	root 'publics#index'
end