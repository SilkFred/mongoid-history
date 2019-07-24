module Current
 thread_mattr_accessor :controller 
end

module Mongoid
  module History
    module Hooks
      extend ActiveSupport::Concern

      included do
        around_action do |controller, block|
          begin
            Current.controller = controller
            block.call
          ensure
            Current.controller = nil
          end
        end
      end
    end
  end
end
