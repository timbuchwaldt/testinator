require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "spec/*_spec.rb"
end

desc "Run tests"
task :default => :test

