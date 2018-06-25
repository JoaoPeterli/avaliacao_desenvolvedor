Rails.application.routes.draw do

   resources :documents
   root "shopping#index"

end
