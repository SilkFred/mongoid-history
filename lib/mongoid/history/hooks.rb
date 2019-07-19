module Current
 thread_mattr_accessor :controller 
end

module Mongoid
  module History
    module Hooks
      extend ActiveSupport::Concern

      included do
        before_action do |controller|
          Current.controller = controller
        end

        # Need to ensure this with around_action
        after_action do |controller|
          Current.controller = nil
        end
      end
    end
  end
end
