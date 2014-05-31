module Cloudconvert
  MissingAPIKey = Class.new(StandardError)

  class Configuration
    CONVERSION_URL = 'https://api.cloudconvert.org/'

    attr_accessor :api_key, :callback, :api_url

    def initialize
      @api_key  = nil
      @callback = nil
      @api_url  = CONVERSION_URL
    end

    def validate!
      raise MissingAPIKey if api_key.nil?
    end
  end

  class << self
    ##
    # :attr-reader: configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration if block_given?
    end
  end
end
