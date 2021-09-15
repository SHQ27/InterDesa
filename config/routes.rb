Rails.application.routes.draw do
  root :controller => 'home', :action => :index
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
