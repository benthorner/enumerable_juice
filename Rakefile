task default: [:spec, :cucumber]

task :spec do
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
end

task :cucumber do
  require 'cucumber'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format pretty"
  end
end
