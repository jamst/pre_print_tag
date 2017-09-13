Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :employees do
      collection do
        get 'forget_password'
        post 'forget_password'
        get 'reset_mail'
        get 'error_mail'
      end
    end
   
    resources :bar_codes
    resources :tags do
      collection do
        get :print
        get :many_print
      end
    end

  end

  root to: 'admin/bar_codes#index'
  devise_for :employees, path: "admin", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'cmon_let_me_in' }, controllers: { sessions: "admin/sessions", passwords: "admin/passwords"}

end
