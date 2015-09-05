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
  get "edit_event" => "events#edit" #edit for individual vents
  get "event" => "events#show" #delete for individual events
end