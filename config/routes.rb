Rails.application.routes.draw do
  resources :buckets do 
    resources :events
  end

  root "buckets#index"
end