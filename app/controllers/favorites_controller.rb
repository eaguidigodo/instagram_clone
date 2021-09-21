class FavoritesController < ApplicationController
    def show
    #    @posts = {}
        user = User.find(current_user.id)
        @all_favorites= user.favorites

       # puts "#{@all_favorites.to_json}"

       # @all_favorites.each do |post| 
        #    post_tmp = Post.find(post.post_id)
         #   puts "Ici un favori: #{post.to_json}"
          # print "Ici ma nouvelle donne pour post temp avant#{post_tmp} "
           # @posts[post.id] = post_tmp.to_json
           # print "Ici ma nouvelle donne apres le#{post_tmp} "
            #print "Ici ma nouvelle donne pour le total#{@posts} "

       # end
       
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


  
