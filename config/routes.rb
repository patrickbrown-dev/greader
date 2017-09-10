Rails.application.routes.draw do
  get '/', controller: 'index', action: 'index'

  resources :feeds do
    resources :items
  end
end
