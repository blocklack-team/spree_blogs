class Spree::Api::ArticlesController < ::Spree::Api::V2::ResourceController
	before_action :require_spree_current_user, except: [:index, :show]
	before_action :load_product, only: [:index, :show]

	def index
		posts = @blog.posts.published_and_visible
	  
		if posts.present?
			response = posts.map do |post|
				{
					id: post.id,
					title: post.title,
					content: post.content,
					slug: post.slug,
					excerpt: post.excerpt,
					post_image: post.post_image.present? ? main_app.url_for(post.post_image.attachment) : '',
					author: post.author_display_name ? post.author_display_name : '',
					published_at: post.published_at
				}
			end
			render json: response, status: :ok
		else
			render json: { errors: 'No articles found' }, status: :ok
		end
	end

	def show
		post = @blog.posts.published_and_visible.find(params[:id])

		if post.present?
			response = {
				id: post.id,
				title: post.title,
				content: post.content,
				slug: post.slug,
				excerpt: post.excerpt,
				post_image: post.post_image.present? ? main_app.url_for(post.post_image.attachment) : '',
				author: post.author_display_name ? post.author_display_name : '',
				published_at: post.published_at
			}
			render json: response, status: :ok
		else
			render json: { errors: 'No articles found' }, status: :ok
		end
	end

	private

	def load_product
		@blog = Spree::Blog.friendly.find(params[:blog_id])
	end
end
