require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:base_e2e) do |t|
  ENV['LOCATION_RUNNER'] = 'local'
  t.pattern = Dir.glob('spec/*_spec.rb')
  t.rspec_opts = ['--format documentation', '--require spec_helper', '--color']
  t.verbose = false
end

task :e2e_local do |t, args|
  Rake::Task["base_e2e"].invoke
  Rake::Task["base_e2e"].reenable
end

task :default => :e2e_local
