Gem::Specification.new do |s|
  s.name        = 'testinator'
  s.version     = '0.0.2'
  s.date        = '2013-04-02'
  s.summary     = "Create test for chef cookbooks"
  s.description = "A simple gem to create chef cookbook tests (using chefspec and fauxhai)"
  s.authors     = ["Tim Buchwaldt"]
  s.email       = 'tim@buchwaldt.ws'
  s.files       = ["lib/testinator.rb", "bin/testinator","template/Gemfile","template/default_spec.rb.erb"]
  s.executables << "testinator"
  s.homepage    = 'http://rubygems.org/gems/testinator'
  s.add_runtime_dependency "thor",    ["~> 0.14.0"]
end
