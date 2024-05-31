Rails.application.config.after_initialize do

  items = [
  	Spree::Admin::MainMenu::ItemBuilder.new('Blogs', Spree::Core::Engine.routes.url_helpers.admin_blogs_path()).build
  ]

  Rails.application.config.spree_backend.main_menu.add(
    Spree::Admin::MainMenu::SectionBuilder.new(Spree.t(:blogs), 'blogs.svg').
      with_admin_ability_check(Spree::Blog).
      with_items(items).
      build
  )
end