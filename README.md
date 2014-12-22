enumerable_juice
================

A set of extensions to get the juice out of Ruby Enumerables

Install
=======

First install the gem.

```
  gem install enumerable_juice
```

Then require it in your code.

```
  require 'enumerable_juice'
```

That's it.

Usage
=====

Limits:

```ruby
  [1].single   # => 1
```

```ruby
  [1].limit.exactly(1)   # => [1]
  [1].limit.exactly(0)   # => ValidationError

  [1].limit.at_least(0)  # => [1]
  [1].limit.at_least(2)  # => ValidationError

  [1].limit.at_most(1)   # => [1]
  [1].limit.at_most(0)   # => ValidationError
```
