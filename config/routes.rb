Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get '/', to: 'welcome#index'
	
	get '/restaurants', to: 'restaurants#index'
	post '/restaurants', to: 'restaurants#create'
	get '/restaurants/new', to: 'restaurants#new'

	get '/restaurants/:id', to: 'restaurants#show'
	patch '/restaurants/:id', to: 'restaurants#update'
	get '/restaurants/:id/edit', to: 'restaurants#edit'
	get '/restaurants/:id/items', to: 'restaurant_items#index'
	get '/restaurants/:id/items/new', to: 'restaurant_items#new'
	post '/restaurants/:id/items', to: 'restaurant_items#create'
	delete '/restaurants/:id', to: 'restaurants#destroy'

	get '/items', to: 'items#index'
	get '/items/:id', to: 'items#show'
	get '/items/:id/edit', to: 'items#edit'
	patch '/items/:id', to: 'items#update'
	delete '/items/:id', to: 'items#destroy'

end
