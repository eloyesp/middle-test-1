require 'test_helper'
require 'minitest/mock'

class TestXYZService < MiniTest::Unit::TestCase

  def test_xyz_filename

    object = MiniTest::Mock.new
    # [day of month zero-padded][three-letter prefix] \
    # _[kind]_[age_if_kind_personal]_[target.id] \
    # _[8 random chars]_[10 first chars of title].jpg
    filename = XYZService.xyz_filename object
    assert_match /[0-9]/, filename
  end

end

