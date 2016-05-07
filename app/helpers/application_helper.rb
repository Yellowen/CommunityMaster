module ApplicationHelper
  extend Faalis::Helpers::AutoloadHelper

  puts ">>>>>>>>>>>>>>>>>>>>>>>"
  autoload_helper :draw_menu, 'Faalis::Page::MenusHelper'


  puts "*" * 50, methods
end
