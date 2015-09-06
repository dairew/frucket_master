Rails.application.routes.draw do
	
  devise_for :users
  
  resources :buckets do 
    resources :events do 
    	member do
    		patch :complete
        put "like", to: "events#upvote"
    	end
    end
  end

  root "buckets#index"
end