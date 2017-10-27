Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#index'

  get 'signup'  => 'users#new'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :songs
  resources :genres
  resources :albums
  resources :artists
  resources :playlists

  # Edit password
  get 'users/:id/edit_password' => 'users#edit_password', as: 'edit_user_password'
  patch 'users/:id/update_password' => 'users#update_password'

  # Grant admin permissions
  patch 'users/:id/admin' => 'users#grant_admin', as: 'grant_admin'
  delete 'users/:id/admin' => 'users#revoke_admin', as: 'revoke_admin'

  # Favorites
  post 'users/:user_id/favorites/songs/:song_id' => 'favorites#mark_song', as: 'add_favorite_song'
  post 'users/:user_id/favorites/artists/:artist_id' => 'favorites#mark_artist', as: 'add_favorite_artist'
  post 'users/:user_id/favorites/albums/:album_id' => 'favorites#mark_album', as: 'add_favorite_album'

  delete 'users/:user_id/favorites/songs/:song_id' => 'favorites#remove_song', as: 'remove_favorite_song'
  delete 'users/:user_id/favorites/artists/:artist_id' => 'favorites#remove_artist', as: 'remove_favorite_artist'
  delete 'users/:user_id/favorites/albums/:album_id' => 'favorites#remove_album', as: 'remove_favorite_album'

  # Comments
  post 'songs/:song_id/comments' => 'comments#comment_song', as: 'comment_song'
  post 'artists/:artist_id/comments' => 'comments#comment_artist', as: 'comment_artist'
  post 'albums/:album_id/comments' => 'comments#comment_album', as: 'comment_album'

  delete 'songs/:song_id/comments/:comment_id' => 'comments#remove_comment_song', as: 'remove_comment_song'
  delete 'artists/:artist_id/comments/:comment_id' => 'comments#remove_comment_artist', as: 'remove_comment_artist'
  delete 'albums/:album_id/comments/:comment_id' => 'comments#remove_comment_album', as: 'remove_comment_album'

  # User wall
  post 'users/:receiver_id/wall_messages' => 'wall_messages#new_wall_message', as: 'new_wall_message'

  delete 'users/:receiver_id/wall_messages/:message_id' => 'wall_messages#remove_wall_message', as: 'remove_wall_message'

  # Ratings
  post 'songs/:song_id/ratings' => 'ratings#rate_song', as: 'rate_song'

  # Following
  post 'users/:follower_id/follows/:followed_id' => 'follows#follow', as: 'follow'

  delete 'users/:follower_id/follows/:followed_id' => 'follows#unfollow', as: 'unfollow'


end

#### HELP COMMENTS FROM CODECADEMY
# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'

# Example of regular route:
#   get 'products/:id' => 'catalog#view'

# Example of named route that can be invoked with purchase_url(id: product.id)
#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

# Example resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Use of 'resources :artists' is equivalent to:
# get 'artists' => 'artists#index'
# get 'artists/new' => 'artists#new', as: 'new_artist'
# get 'artists/:id' => 'artists#show', as: 'artist'
# get 'artists/:id/edit' => 'artists#edit', as: 'edit_artist'
# post 'artists' => 'artists#create'
# patch 'artists/:id' => 'artists#update'
# delete 'artists/:id' => 'artists#destroy'


# Example resource route with options:
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

# Example resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Example resource route with more complex sub-resources:
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', on: :collection
#     end
#   end

# Example resource route with concerns:
#   concern :toggleable do
#     post 'toggle'
#   end
#   resources :posts, concerns: :toggleable
#   resources :photos, concerns: :toggleable

# Example resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end
