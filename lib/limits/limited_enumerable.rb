require_relative 'validation_error'

module EnumerableJuice
  module Limits
    class LimitedEnumerable
      def initialize enumerable
        @enumerable = enumerable
      end

      def exactly limit
        check_for :!=, limit
        @enumerable
      end

      def at_least limit
        check_for :<, limit
        @enumerable
      end

      def at_most limit
        check_for :>, limit
        @enumerable
      end

      private def check_for operator, limit
        count = @enumerable.count

        if count.send(operator, limit)
          raise_error "#{count} #{operator} #{limit}"
        end
      end

      private def raise_error message
        raise ValidationError, "Invalid number of items (#{message})"
      end
    end
  end
end
