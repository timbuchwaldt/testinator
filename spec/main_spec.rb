require 'minitest/spec'
require 'minitest/autorun'
require 'testinator'
require 'mocha/setup'

describe Testinator do

  it "outputs help when no command is given" do
    out = capture_io{
      Testinator.start %w""
    }.join ''
    out.must_match /setup NAME PATH/
  end

  it "outputs help when no argument is given to setup" do
    out = capture_io{
      Testinator.start %w"setup"
    }.join ''
    out.must_match /setup was called with no arguments/
    out.must_match /setup NAME PATH/
  end

  it "runs all needed step when invoked correctly" do
    Testinator.any_instance.expects(:copy_file).with("Gemfile").returns(true)
    Testinator.any_instance.expects(:empty_directory).with("spec").returns(true)
    Testinator.any_instance.expects(:template).with('default_spec.rb.erb', 'spec/default_spec.rb').returns(true)
    Testinator.any_instance.expects(:run).with('bundle install').returns(true)
    Testinator.start %w"setup foobar foo"
  end
end