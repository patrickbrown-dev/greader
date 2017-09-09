Rails.application.routes.draw do

  resources :feeds do
    resources :items
  end
end
