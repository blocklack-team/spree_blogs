class Spree::Api::ArticlesController < ::Spree::Api::V2::ResourceController
	before_action :require_spree_current_user, except: [:index, :show]
	before_action :load_product, only: [:index, :show]

	def index
		posts = @blog.posts.published_and_visible
	  
		if posts.present?
			render json: posts, status: :ok
		else
			render json: { errors: 'No articles found' }, status: :ok
		end
	end

	def show
		post = @blog.posts.published_and_visible.find(params[:id])

		if post.present?
			render json: post, status: :ok
		else
			render json: { errors: 'No articles found' }, status: :ok
		end
	end

	private

	def load_product
		@blog = Spree::Blog.friendly.find(params[:blog_id])
	end
end
