require_relative 'limited_enumerable'

ROOT = EnumerableJuice::Limits

module Enumerable
  def limit
    ROOT::LimitedEnumerable.new self
  end

  def single
    limit.exactly(1).first
  end
end
