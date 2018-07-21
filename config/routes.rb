Rails.application.routes.draw do
  # get 'react/root'
  root to: "react#root"

  devise_for :users

  
  if Rails.env.development?
    # authenticate :user do
      mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
    # end
  end

  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resource :application, only: :show
  
end
