require 'test_helper'
require 'minitest/mock'

class TestXYZService < MiniTest::Unit::TestCase

  def setup
    @object = MiniTest::Mock.new
    @object.expect :publish_on, Date.new(2012, 11, 8)
    @object.expect :xyz_category_prefix, "SEL"
    @object.expect :kind, "a_blog"
    @object.expect :id, 1538
    @object.expect :title, "a realy good title"
  end

  def test_xyz_filename_with_no_person
    @object.expect :personal?, false
    filename = XYZService.xyz_filename @object
    assert_match /08SELablog_1538_[a-z0-9]{8}_arealygood.jpg/, filename
    @object.verify
  end

  def test_xyz_filename_with_a_person
    @object.expect :personal?, true
    @object.expect :age, 19
    filename = XYZService.xyz_filename @object
    assert_match /08SELablog_019_1538_[a-z0-9]{8}_arealygood.jpg/, filename
    @object.verify
  end

end

