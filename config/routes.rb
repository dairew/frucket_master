Rails.application.routes.draw do
	
  resources :details
  devise_for :users
  
  resources :buckets do 
    resources :events do 
    	member do
    		patch :complete
    	end
    end
  end

  root "buckets#index"
end