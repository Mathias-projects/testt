Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  resource :working_hours_table, except: [:show]
  resources :medical_treatments
  get 'working_hours_tables', to: 'working_hours_tables#index'
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
