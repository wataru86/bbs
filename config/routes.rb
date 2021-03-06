Rails.application.routes.draw do
  root to: 'topics#index'
  get 'topics/index'
  get 'topics/show/:id' => 'topics#show', as: :topics_show
  post 'topics/create' => 'topics#create'
  delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete

  post 'topics/edit/:id' => 'topics#edit', as: :topics_edit
  patch 'topics/editTitle/:id' => 'topics#editTitle', as: :topics_editTitle

  post 'posts/create' => 'post#create', as: :post_create
  post 'topics/reply/:id' => 'topics#reply', as: :post_reply
  delete 'posts/delete/:id' => 'post#delete', as: :post_delete
end
