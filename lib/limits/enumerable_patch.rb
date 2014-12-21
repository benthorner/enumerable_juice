require_relative 'limited_enumerable'

module Enumerable
  def limit
    LimitedEnumerable.new self
  end

  def single
    limit.exactly(1).first
  end
end
