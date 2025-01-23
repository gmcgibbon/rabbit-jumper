require "app/game"

MAIN = self

class Game
  class TestCase
    module Runner
      class << self
        def require_all
          each_ruby_file(inside: "test").each do |file|
            require file if file.end_with?("_test.rb")
          end
        end

        private

        def each_ruby_file(inside:)
          GTK.list_files(inside).flat_map do |file|
            path = File.join(inside, file)

            if GTK.stat_file(path).fetch(:file_type) == :directory
              each_ruby_file(inside: path)
            else
              path
            end
          end
        end
      end
    end

    attr_reader :assert

    def initialize(assert)
      @assert = assert
    end

    def setup
    end

    def teardown
    end

    def run(test_name, args)
      setup
      public_send(test_name, args)
      teardown
    end

    def public_send(method_name, *args)
      if public_methods.include?(method_name.to_sym)
        send(method_name, *args)
      else
        raise NoMethodError, "private method #{method_name} called for #{self}."
      end
    end

    class << self
      def setup(&block)
        super_setup = superclass.instance_method(:setup)

        define_method(:setup) do
          super_setup.bind(self).call
          instance_exec &block
        end
      end

      def teardown(&block)
        define_method(:teardown) do
          instance_exec &block
        end
      end

      def test(name, &block)
        klass = self
        name = name.gsub(" ", "_")
        test_method_name = "test_#{name}"
        define_method(test_method_name) do |args|
          instance_exec args, &block
        end
        MAIN.define_method("test_#{self}_#{name}") do |args, assert|
          klass.new(assert).run(test_method_name, args)
        end
      end
    end
  end
end

Game::TestCase::Runner.require_all if GTK.argv.end_with?("test_helper.rb")
