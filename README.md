enumerable_juice
================

A set of extensions to get the juice out of Ruby Enumerables

Install
=======

  gem install enumerable_juice

  require 'enumerable_juice'

Usage
=====

Limits:

  [1].single   # => 1

  [1].limit.exactly(1)   # => [1]
  [1].limit.exactly(0)   # => ValidationError

  [1].limit.at_least(0)  # => [1]
  [1].limit.at_least(2)  # => ValidationError

  [1].limit.at_most(1)   # => [1]
  [1].limit.at_most(0)   # => ValidationError
