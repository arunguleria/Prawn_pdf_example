Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pdf_generator#index'
  get 'generate_pdf', to: 'pdf_generator#generate_pdf'
end
