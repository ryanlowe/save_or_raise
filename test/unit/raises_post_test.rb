require File.dirname(__FILE__) + '/../test_helper'

class RaisesPostTest < ActiveSupport::TestCase
  fixtures :raises_posts
  
  def test_fixtures
    assert raises_posts(:hello).valid?
  end
end
