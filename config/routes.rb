Rails.application.routes.draw do
	
  devise_for :users
  resources :buckets do 
    resources :events do 
    	member do
    		patch :complete
    	end
    end
  end

  root "buckets#index"
  get "edit_event" => "events#edit"
  get "event" => "events#show"
end