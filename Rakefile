require 'rake_n_bake'
require 'rubygems/package'
require 'rspec/core/rake_task'

task :default => [
  :"spec:unit",
  :"spec:integration",
  :"bake:ok_rainbow"
]

desc 'Build all gems in the current directory and push to RubyGems'
task :deploy => [
  :"deploy:build",
  :"deploy:push",
  :"deploy:cleanup"
]

desc 'Yank the latest versions of each gem in the current directory'
task :rollback => [
  :"deploy:yank"
]

namespace :spec do
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = 'spec/unit/**/*_spec.rb'
  end

  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = 'spec/integration/**/*_spec.rb'
  end
end

namespace :deploy do
  desc 'Build a gem for each gemspec in the current directory'
  task :build do
    Dir['*.gemspec'].each do |path|
      spec = Gem::Specification.load path
      Gem::Package.build(spec)
    end
  end

  desc 'Push all gems in the current directory to RubyGems'
  task :push do
    Dir['*.gem'].each do |path|
      system('gem', 'push', path)
    end
  end

  desc 'Remove all .gem files in the current directory'
  task :cleanup do
    Dir['*.gem'].each do |path|
      File.delete path
    end
  end

  desc 'Yank the latest versions of each gem in the current directory'
  task :yank do
    Dir['*.gemspec'].each do |path|
      spec = Gem::Specification.load path

      system(
        'gem yank', spec.name,
        "-v#{spec.version.to_s}")
    end
  end
end
