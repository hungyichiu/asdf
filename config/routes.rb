Rails.application.routes.draw do
  #API
  namespace :api do
    namespace :v2 do
      resources :candidates, only: [:index, :show]
    end
  end

  devise_for :users
  
  resources :candidates do 
    member do
      # put :vote, to: 'candidates#vote'
      put :vote #put /candidates/2/vote
    end  
  end

  root 'candidates#index'
end
