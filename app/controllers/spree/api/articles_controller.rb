class Spree::Api::ArticlesController < Spree::StoreController
	def show
		@blog = Spree::Blog.by_store(current_store).friendly.find(params[:blog_id])

		@post = if try_spree_current_user.try(:has_spree_role?, "admin")
			@blog.posts.find(params[:id])
		else
			@blog.posts.published_and_visible.find(params[:id])
		end

		@title = @post.post_seo_title

		respond_to do |format|
			format.json { render json: @post, status: :ok }
		end
	end
end
