require 'minitest/autorun'
require 'minitest/reporters'
require 'awesome_print'
require 'pry'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |file| require file }

MiniTest::Unit.runner = MiniTest::SuiteRunner.new
MiniTest::Unit.runner.reporters << MiniTest::Reporters::ProgressReporter.new

class MiniTest::Spec
  class << self
    alias :context :describe
  end
end
