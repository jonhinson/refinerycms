module Refinery
  autoload :<%= class_name.pluralize %>Generator, File.expand_path('../generators/<%= plural_name %>_generator', __FILE__)

  module <%= class_name.pluralize %><%= 'Engine' if plural_name == singular_name %>
    class Engine < Rails::Engine
      isolate_namespace Refinery

      initializer "init plugin", :after => :set_routes_reloader do |app|
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinery_<%= plural_name %>"
          plugin.directory = "<%= plural_name %>"
          plugin.url = '/refinery/<%= plural_name %>'
          plugin.activity = {
            :class_name => "Refinery::<%= class_name %>"<% if (title = attributes.detect { |a| a.type.to_s == "string" }).present? and title.name != 'title' %>,
            :title => '<%= title.name %>'<% end %>
          }
        end
      end
    end
  end
end
