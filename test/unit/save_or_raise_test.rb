require File.dirname(__FILE__) + '/../test_helper'

class SaveOrRaiseTest < Test::Unit::TestCase
  fixtures :raises_posts
  
  #
  # regular Rails behaviour
  #
  
  def test_new_save
    rp = RaisesPost.new
    assert !rp.save
    assert_raises(ActiveRecord::RecordInvalid) {
      rp.save!
    }
    
    rp.title = "Title"
    assert rp.save
    assert rp.save!
  end
  
  def test_changed_save
    rp = raises_posts(:hello)
    assert_equal "Hello World!", rp.title
    
    rp.title = ""
    assert !rp.save
    assert_raises(ActiveRecord::RecordInvalid) {
      rp.save!
    }
    
    rp.title = "Goodbye"
    assert rp.save
    assert rp.save!
  end
  
  def test_unchanged_save
    rp = raises_posts(:hello)
    assert_equal "Hello World!", rp.title
    
    rp.title = "Hello World!"
    assert rp.save
    assert rp.save!
  end
  
  #
  # save_or_raise
  #
  
  def test_new_save_or_raise
    rp = RaisesPost.new
    assert_raises(ActiveRecord::RecordNotSaved) {
      rp.save_or_raise
    }
    
    rp.title = "Title"
    assert rp.save_or_raise
  end
  
  def test_changed_save_or_raise
    rp = raises_posts(:hello)
    assert_equal "Hello World!", rp.title
    
    rp.title = ""
    assert_raises(ActiveRecord::RecordNotSaved) {
      rp.save_or_raise
    }
    
    rp.title = "Goodbye"
    assert rp.save_or_raise
  end
  
  def test_unchanged_save_or_raise
    rp = raises_posts(:hello)
    assert_equal "Hello World!", rp.title
    
    rp.title = "Hello World!"
    assert rp.save_or_raise
  end
  
  #
  # save_or_raise(nil)
  #
  
  def test_new_save_or_raise_nil
    rp = RaisesPost.new
    assert_raises(ActiveRecord::RecordNotSaved) {
      rp.save_or_raise(nil)
    }
    
    rp.title = "Title"
    assert rp.save_or_raise(nil)
  end
  
  def test_changed_save_or_raise_nil
    rp = raises_posts(:hello)
    assert_equal "Hello World!", rp.title
    
    rp.title = ""
    assert_raises(ActiveRecord::RecordNotSaved) {
      rp.save_or_raise(nil)
    }
    
    rp.title = "Goodbye"
    assert rp.save_or_raise(nil)
  end
  
  def test_unchanged_save_or_raise_nil
    rp = raises_posts(:hello)
    assert_equal "Hello World!", rp.title
    
    rp.title = "Hello World!"
    assert rp.save_or_raise(nil)
  end
  
  #
  # save_or_raise("woops!")
  #
  
  def test_new_save_or_raise_message
    rp = RaisesPost.new
    assert_raises(RuntimeError,"woops!") {
      rp.save_or_raise("woops!")
    }
    
    rp.title = "Title"
    assert rp.save_or_raise("woops!")
  end
  
  def test_changed_save_or_raise_message
    rp = raises_posts(:hello)
    assert_equal "Hello World!", rp.title
    
    rp.title = ""
    assert_raises(RuntimeError,"woops!") {
      rp.save_or_raise("woops!")
    }
    
    rp.title = "Goodbye"
    assert rp.save_or_raise("woops!")
  end
  
  def test_unchanged_save_or_raise_message
    rp = raises_posts(:hello)
    assert_equal "Hello World!", rp.title
    
    rp.title = "Hello World!"
    assert rp.save_or_raise("woops!")
  end
  
  #
  # save_or_raise(CustomException)
  #
  
  class CustomException < StandardError
  end
  
  def test_new_save_or_raise_exception
    rp = RaisesPost.new
    assert_raises(CustomException) {
      rp.save_or_raise(CustomException)
    }
    
    rp.title = "Title"
    assert rp.save_or_raise(CustomException)
  end
  
  def test_changed_save_or_raise_exception
    rp = raises_posts(:hello)
    assert_equal "Hello World!", rp.title
    
    rp.title = ""
    assert_raises(CustomException) {
      rp.save_or_raise(CustomException)
    }
    
    rp.title = "Goodbye"
    assert rp.save_or_raise(CustomException)
  end
  
  def test_unchanged_save_or_raise_exception
    rp = raises_posts(:hello)
    assert_equal "Hello World!", rp.title
    
    rp.title = "Hello World!"
    assert rp.save_or_raise(CustomException)
  end
  
end