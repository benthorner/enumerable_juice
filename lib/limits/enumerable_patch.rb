require_relative 'limited_enumerable'

ROOT = EnumerableJuice::Limits

module Enumerable
  ##
  # Wraps this enumerable in a LimitedEnumerable
  # to assert a limit on the number of items.
  ##
  def limit
    ROOT::LimitedEnumerable.new self
  end

  ##
  # Returns the single element of this enumerable if
  # it exists. If the enumerable has no elements, or
  # has more than one element, a ValidationError is raised.
  ##
  def single
    limit.exactly(1).first
  end
end
