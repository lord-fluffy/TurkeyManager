Rails.application.routes.draw do
  resources :turkeys do
    collection do
      get :report
    end
  end
end
