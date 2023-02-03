Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get '/', to: 'welcome#index'
	get '/restaurants', to: 'restaurants#index'
	get '/restaurants/new', to: 'restaurants#new'
	post '/restaurants', to: 'restaurants#create'
	get '/restaurants/:id', to: 'restaurants#show'
	patch '/restaurants/:id', to: 'restaurants#update'
	get '/restaurants/:id/edit', to: 'restaurants#edit'
	get '/restaurants/:id/items', to: 'restaurant_items#index'
	get '/items', to: 'items#index'
	get '/items/:id', to: 'items#show'
end
