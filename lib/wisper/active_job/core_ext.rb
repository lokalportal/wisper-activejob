if Gem.loaded_specs['activejob'].version < Gem::Version.create('6.0')
  module ActiveSupport
    class TimeWithZone
      include GlobalID::Identification

      def to_global_id(options = {})
        super(options.merge(app: "wisper-activejob-coreext"))
      end

      def id
        iso8601
      end

      def self.find(iso8601_string)
        Time.zone.parse(iso8601_string)
      end
    end
  end

  class Time
    include GlobalID::Identification

    def to_global_id(options = {})
      super(options.merge(app: "wisper-activejob-coreext"))
    end

    def id
      iso8601
    end

    def self.find(iso8601_string)
      Time.parse(iso8601_string)
    end
  end

  class Date
    include GlobalID::Identification

    def to_global_id(options = {})
      super(options.merge(app: "wisper-activejob-coreext"))
    end

    def id
      iso8601
    end

    def self.find(iso8601_string)
      Date.parse(iso8601_string)
    end
  end
end
