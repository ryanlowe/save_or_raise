require 'save_or_raise'
ActiveRecord::Base.send(:include, ActiveRecord::SaveOrRaise)