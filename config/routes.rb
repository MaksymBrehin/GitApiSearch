Rails.application.routes.draw do
  root 'git#index'
  get 'git' => 'git#index', as: 'git'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
