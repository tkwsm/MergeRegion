#!/usr/bin/ruby

require 'minitest/autorun'
require './MergeRegion.rb'

class ClassMergeRegion
  include MergeRegion
end

class TC_MergeRegion < MiniTest::Unit::TestCase

  def setup
    @mr = ClassMergeRegion.new
    @sarray1        = [[10, 20], [15, 35], [70, 100], [75, 105], [50, 60]]
    @merged_sarray1 = [[10, 35], [50, 60], [70, 105]]

    @sarray2        = [[36, 133], [146, 243], [43,  136], [152, 197], 
                       [37,  87], [148, 197], [222, 353], [363, 438]]
    @merged_sarray2 = [[36, 136], [146, 353], [363, 438]]
  end

  def test_sampletest
    assert_equal( "good result", @mr.sampletest)
  end

  def test_merge_region
    assert_equal( @merged_sarray1, @mr.merge_region( @sarray1 ) )
    assert_equal( @merged_sarray2, @mr.merge_region( @sarray2 ) )
  end

end


