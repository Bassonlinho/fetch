Rails.application.routes.draw do
	devise_for :users, controllers: { registrations: "registrations" }
	resources :tasks do
		put "update"
	end
	root 'tasks#new'
end
