Rails.application.routes.draw do
  root "todos#index"
  resources :todos do
    get :completed, on: :collection
    get :uncompleted, on: :collection
    put :set_status, on: :member 
  end
end
