Refinery::Core::Engine.routes.draw do
  namespace :admin, path: Refinery::Core.backend_route do
    resources :pages, except: :show do
      collection do
        get :deleted
      end

      resources :versions, only: [:destroy] do
        member do
          get :diff, to: 'versions#diff'
          patch :rollback, to: 'versions#rollback'
        end
      end
    end

    resources :versions, only: [] do
      member do
        patch :bringback  # <= and that
      end
    end

  end
end

