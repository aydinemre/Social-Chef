Rails.application.routes.draw do
  devise_for :users
 resources :recipes do 
 	resources :comments
 	member do
  		get "like", to: "recipes#upvote"
  		get "dislike", to: "recipes#downvote"
	end
 end

 root "recipes#index"
end
