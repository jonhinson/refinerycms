require 'refinerycms-core'

module Refinery
  autoload :<%= class_name.pluralize %>Generator, File.expand_path('../generators/<%= plural_name %>_generator', __FILE__)

  module <%= class_name.pluralize %><%= 'Engine' if plural_name == singular_name %>
    require 'refinery/<%= plural_name %>/engine' if defined?(Rails)

    class << self
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end
    end
  end
end
