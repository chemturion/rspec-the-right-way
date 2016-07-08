# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rspec/core/rake_task'
require File.expand_path('../config/application', __FILE__)
begin
  RSpec::Core::RakeTask.new(:spec) do |t|
    #t.pattern = Dir.glob('spec/**/*_spec.rb')
  end
rescue LoadError
end

Rails.application.load_tasks
