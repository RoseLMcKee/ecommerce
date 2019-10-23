Rails.application.routes.draw do
  devise_for :users
  get 'categorical' => 'storefronts#items_by_category'
  get 'branding' => 'storefronts#items_by_brand'
  
  root 'storefronts#all_item'
  resources :categories
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
