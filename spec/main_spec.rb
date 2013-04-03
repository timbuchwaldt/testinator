require 'minitest/spec'
require 'minitest/autorun'
require 'testinator'

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
end