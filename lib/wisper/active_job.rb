require "wisper/active_job/version"
require "active_job"
require "wisper"
require "wisper/active_job_broadcaster"
require "wisper/active_job/core_ext"

module Wisper
  module ActiveJob
    class << self
      def job_wrapper_class
        @job_wrapper_class ||= Wisper::ActiveJobBroadcaster::Wrapper
      end

      attr_writer :job_wrapper_class
    end
  end
end
