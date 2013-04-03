require 'thor'
require 'fileutils'

Config = Struct.new(:name)

class Testinator < Thor
  include Thor::Actions

  desc "setup NAME PATH","Setup up cookbook test files for the given name and path (default: current dir)"
  def setup(name,path=".")
    @app = Config.new
    @app.name = name
    self.destination_root = File.expand_path(File.join(Dir.pwd,path))
    copy_file 'Gemfile'
    empty_directory 'spec'
    template 'default_spec.rb.erb', 'spec/default_spec.rb'
    inside(self.destination_root) do
      run('bundle install')
    end
  end

  def self.source_root
    File.expand_path(File.join(File.dirname(__FILE__), "..", "template"))
  end

end