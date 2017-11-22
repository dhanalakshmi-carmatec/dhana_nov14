Rails.application.routes.draw do

  devise_for :users
  
  root 'home#index'
  
  resources :users, path: "musers" do
  	resources :contacts
  end 	

  resources :contacts do
    resources :contact_addresses
    resources :contact_phone_numbers    
  end   
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
