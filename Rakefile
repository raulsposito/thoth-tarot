#require "bundler/gem_tasks"
#require "rspec/core/rake_task"

#RSpec::Core::RakeTask.new(:spec)

#task :default => :spec

# this rake rile should look like this

require_relative './config/environment'

def reload!
  load_all './lib'
end

task :console
  Pry.start 
end