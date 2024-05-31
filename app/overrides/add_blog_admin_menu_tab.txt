# frozen_string_literal: true

AddBlogAdminMenuTab = Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'blogs_admin_sidebar_menu',
  insert_bottom: '#main-sidebar',
  partial: "spree/admin/shared/blogs_sidebar_menu",
)
