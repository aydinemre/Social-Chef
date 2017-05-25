Rails.application.routes.draw do
  	devise_for :users
 	resources :recipes do
 		member do
	  		get "like", to: "recipes#upvote"
	  		get "dislike", to: "recipes#downvote"
		end
	  	resources :comments
	end

 	root "recipes#index"
 	
end
