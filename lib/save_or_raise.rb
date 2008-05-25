module ActiveRecord #:nodoc:
  
  module SaveOrRaise #:nodoc:
    
    def save_or_raise(raiseable = RecordNotSaved)
      success = save
      raise raiseable unless success
      success
    end
    
  end

end