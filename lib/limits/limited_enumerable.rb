require_relative 'validation_error'

module EnumerableJuice
  module Limits
    ##
    # Wraps an Enumerable object in order to
    # assert a limit on the number of items.
    ##
    class LimitedEnumerable
      ##
      # Creates a new LimitedEnumerable to wrap
      # the given Enumerable object.
      ##
      def initialize enumerable
        @enumerable = enumerable
      end

      ##
      # Returns the wrapped enumerable if the
      # count of elements is exactly the specified
      # limit. Otherwise, a ValidationError is raised.
      ##
      def exactly limit
        check_for :!=, limit
        @enumerable
      end

      ##
      # Returns the wrapped enumerable if the
      # count of elements is greater than or equal to
      # (>=) the specified limit. Otherwise, a
      # ValidationError is raised.
      ##
      def at_least limit
        check_for :<, limit
        @enumerable
      end

      ##
      # Returns the wrapped enumerable if the
      # count of elements is less than or equal to (<=)
      # the specified limit. Otherwise, a ValidationError
      # is raised.
      ##
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
