FiatPublication::Engine.routes.draw do
  resources :pages
  resources :articles
  resources :content_blocks
  resources :authors
  resources :messages
  resources :comments
  resources :attachments
  resources :navigation_groups
  resources :navigation_items
  resources :content_labels
  resources :content_label_assignments
  resources :custom_fields
  resources :snoozes
end
