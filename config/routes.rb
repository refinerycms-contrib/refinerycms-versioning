Refinery::Core::Engine.routes.draw do
  # Admin routes
  namespace :versioning, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}" do
      get '/pages/history', to: 'pages#history', as: :pages_history
    end
  end
end

