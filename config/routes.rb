Rails.application.routes.draw do
  get '/design/(:page)', to: 'design#page'
end
