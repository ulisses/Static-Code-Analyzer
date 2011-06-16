SampleApp::Application.routes.draw do
  
# get "testes/index"
# get "tentativas/index"
# get "tentativas/create"
# get "tentativas/destroy"
# get "funcoes/index"
# get "funcoes/new"
# get "linguagens/index"
# get "linguagens/new"
# get "enunciado/show" 
# get "enunciado/new" 
# get "participantes/index"
# get "participantes/create"
# get "concursos/index"
# get "concursos/new"
# get "concursos/show"
# get "concursos/destroy"
# get "concursos/create"

  resources :sessions, :only => [:new, :create, :destroy]
  resources :concorrentes
  resources :users
  match '/concursos/stats',  :to => 'concursos#stats'
  resources :concursos
  resources :participantes
  match '/enunciados/newxml',  :to => 'enunciados#newxml'
  match '/enunciados/createxml',  :to => 'enunciados#createxml'  
  resources :enunciados 
  resources :languages, :only => [:new,:create,:destroy,:index,:edit,:update]
  resources :functions, :only => [:new,:create,:destroy,:index,:edit,:update]  
  match '/options', :to => 'pages#options'
  resources :tentativas
  resources :baterias#, :only => [:index]
  resources :results
  resources :clone_warnings, :only => [:index,:destroy]
  match '/show_clone', :to => 'clone_warnings#present'
  match '/generateMetrics', :to => 'concursos#generateMetrics'
  match '/downloadMetrics', :to => 'concursos#downloadMetrics'
  
#  resource :tests do
#  collection do
#  get 'submit'
#  end
#  end
  
  get "sessions/new"

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  root :to => 'pages#home'
  
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  
  match '/novo_concorrente', :to => 'concorrentes#new'
  #match '/editar_concorrente', :to => 'concorrentes#edit'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
