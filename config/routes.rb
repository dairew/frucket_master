Rails.application.routes.draw do
	
  resources :buckets do 
    resources :events do 
    	member do
    		patch :complete
    	end
    end
  end

  root "buckets#index"
end