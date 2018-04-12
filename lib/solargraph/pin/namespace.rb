module Solargraph
  module Pin
    class Namespace < Pin::Base
      include Solargraph::NodeMethods

      attr_reader :visibility

      attr_reader :type

      attr_reader :superclass

      def initialize location, namespace, name, docstring, type, visibility, superclass
        super(location, namespace, name, docstring)
        @type = type
        @visibility = visibility
        @superclass_reference = Reference.new(self, superclass) unless superclass.nil?
      end

      def kind
        Pin::NAMESPACE
      end

      # def reference_include name
      #   include_references.push Reference.new(self, name)
      # end

      # def reference_extend name
      #   extend_references.push Reference.new(self, name)
      # end

      # def reference_superclass name
      #   @superclass_reference = Reference.new(self, name)
      # end

      # def name
      #   @name ||= (node.type == :source ? '' : pack_name(node.children[0]).last.to_s)
      # end

      def path
        @path ||= (namespace.empty? ? '' : "#{namespace}::") + name
      end

      # def completion_item_kind
      #   @kind ||= (node.type == :class ? Solargraph::LanguageServer::CompletionItemKinds::CLASS : Solargraph::LanguageServer::CompletionItemKinds::MODULE)
      # end

      # def include_references
      #   @include_references ||= []
      # end

      # def extend_references
      #   @extend_references ||= []
      # end

      # def superclass_reference
      #   @superclass_reference
      # end

      def return_type
        @return_type ||= (type == :class ? 'Class' : 'Module') + "<#{path}>"
      end
    end
  end
end
