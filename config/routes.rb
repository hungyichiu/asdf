Rails.application.routes.draw do
  resources :candidates do 
    member do
      # put :vote, to: 'candidates#vote'
      put :vote #put /candidates/2/vote
    end
    
  end

  root 'candidates#index'
end
