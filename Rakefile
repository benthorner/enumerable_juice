require 'rake_n_bake'
require 'rubygems/package'
require 'rspec/core/rake_task'

task :default => [
  :"spec:unit",
  :"spec:integration",
  :"bake:ok_rainbow"
]

task :deploy => [
  :"deploy:build",
  :"deploy:push",
  :"deploy:cleanup"
]

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
  task :build do
    Dir['*.gemspec'].each do |path|
      spec = Gem::Specification.load path
      Gem::Package.build(spec)
    end
  end

  task :push do
    Dir['*.gem'].each do |path|
      system('gem', 'push', path)
    end
  end

  task :cleanup do
    Dir['*.gem'].each do |path|
      File.delete path
    end
  end

  task :yank do
    Dir['*.gemspec'].each do |path|
      spec = Gem::Specification.load path

      system(
        'gem yank', spec.name,
        "-v#{spec.version.to_s}")
    end
  end
end
