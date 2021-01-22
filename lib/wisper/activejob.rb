require "wisper/active_job"

module Wisper
  module Activejob
    class << self
      def job_wrapper_class
        @job_wrapper_class ||= Wisper::ActiveJobBroadcaster::Wrapper
      end

      attr_writer :job_wrapper_class
    end
  end
end
