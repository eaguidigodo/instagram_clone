class FavoritesController < ApplicationController
    def show
        @favorite = current_user.favorites.find_by(post_id: @post.id)
    end

    def create
        favorite = current_user.favorites.create(post_id: params[:post_id])
        redirect_to posts_path, notice: "#{favorite.post.user.name}'S Post has been added to favorites"
    end

    def destroy
        favorite = current_user.favorites.find_by(id: params[:id]).destroy
        redirect_to posts_path, notice: "#{favorite.post.user.name}Unblogged Mr.'s post"
    end
end
