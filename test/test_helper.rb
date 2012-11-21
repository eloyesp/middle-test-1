require 'bundler/setup'

libdir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift libdir

require 'minitest/autorun'
require 'minitest/benchmark'
require 'pry'

require 'xyz_service'

