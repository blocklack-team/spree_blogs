Rails.application.config.after_initialize do

  items = [
  	Spree::Admin::MainMenu::ItemBuilder.new(I18n.t('spree_blogs.admin.blogs'), Spree::Core::Engine.routes.url_helpers.admin_blogs_path()).build,
    Spree::Admin::MainMenu::ItemBuilder.new(I18n.t('spree_blogs.admin.posts'), Spree::Core::Engine.routes.url_helpers.admin_posts_path()).build
  ]

  Rails.application.config.spree_backend.main_menu.add(
    Spree::Admin::MainMenu::SectionBuilder.new(I18n.t('spree_blogs.admin.blogs'), 'blogs.svg').
      with_admin_ability_check(Spree::Blog).
      with_items(items).
      build
  )
end

SpreeBlogs::Config.use_action_text = true
