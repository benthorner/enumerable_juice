require 'rake_n_bake'
require 'rspec/core/rake_task'

task :default => [
  :"spec:unit",
  :"spec:integration",
  :"bake:ok_rainbow"
]

namespace :spec do
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = 'spec/unit/**/*_spec.rb'
  end

  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = 'spec/integration/**/*_spec.rb'
  end
end
