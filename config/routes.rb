Rails.application.routes.draw do
  devise_for :users
  resources :quotes

  resources :quotes do
    resources :line_item_dates, except: [:index, :show]
  end
  
  root to: "pages#home"
end
