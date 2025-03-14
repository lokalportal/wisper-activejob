require 'wisper'
require 'wisper/active_job/version'
require 'active_job'

module Wisper
  class ActiveJobBroadcaster
    def broadcast(listener, _publisher, event, *args, **kwargs)
      ::Wisper::ActiveJob.job_wrapper_class.perform_later(listener.name, event, *args, **kwargs)
    end

    class Wrapper < ::ActiveJob::Base
      queue_as :default

      def perform(class_name, event, args)
        subscriber = class_name.constantize
        subscriber.public_send(event, *args)
      end
    end

    def self.register
      Wisper.configure do |config|
        config.broadcaster :active_job, ActiveJobBroadcaster.new
        config.broadcaster :async,      ActiveJobBroadcaster.new
      end
    end
  end
end

Wisper::ActiveJobBroadcaster.register
