Rails.application.routes.draw do
	devise_for :admin_users, ActiveAdmin::Devise.config
	ActiveAdmin.routes(self)
	devise_for :users, controllers: { registrations: "registrations" }
	resources :tasks do
		member do
			put "active"
			put "inactive"
		end
	end
	root 'tasks#new'
end
