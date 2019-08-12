Rails.application.routes.draw do
  get 'sessions/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'activities/horas'
  get 'activities/show'

  get 'control_users/horas_user'
  get 'control_users/index'
  get 'control_users/horas_user'

  get 'welcome/index'
  get 'welcome/documents'

  get 'evento/index'
  post 'evento/create'

  get 'duvida/index'
  post 'duvida/create'
  get 'duvida/edit'
  get 'duvida/update'
  post 'duvida/update'

  get 'welcome/duvidas'
  get 'welcome/quem_somos'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'welcome#index'

  resources :activities do
  	  member do
        get 'export'
   	  end
   end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
