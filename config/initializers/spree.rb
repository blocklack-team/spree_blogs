Rails.application.config.after_initialize do

  items = [
  	Spree::Admin::MainMenu::ItemBuilder.new('Invoices', Spree::Core::Engine.routes.url_helpers.admin_bookkeeping_documents_path(q: { template_eq: 'invoice' })).build,
    Spree::Admin::MainMenu::ItemBuilder.new('Packaging Slips', Spree::Core::Engine.routes.url_helpers.admin_bookkeeping_documents_path(q: { template_eq: 'packaging_slip' })).build
  ]

  Rails.application.config.spree_backend.main_menu.add(
    Spree::Admin::MainMenu::SectionBuilder.new(Spree.t(:documents, scope: [:print_invoice]), 'file.svg').
      with_admin_ability_check(Spree::Order).
      with_items(items).
      build
  )

  Rails.application.config.spree_backend.tabs[:blog].add(
    Spree::Admin::Tabs::TabBuilder.new(
      I18n.t('spree_blogs.admin.blogs'), 
      ->(blog) { Spree::Core::Engine.routes.url_helpers.admin_blogs_path(blog) }
    ).
    with_icon_key('blogs.svg').
    with_active_check.
    build
  )
end
