Rails.application.routes.draw do
	devise_for :users, controllers: { registrations: "registrations" }
	resources :tasks do
		put "active"
		put "inactive"
	end
	root 'tasks#new'
end
