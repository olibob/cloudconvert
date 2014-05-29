module Cloudconvert
  class Client
    # Faraday middleware
    def initialize(config = Cloudconvert.configuration)
      config.validate!

      @conn ||= Faraday.new(url: config.api_url) do |faraday|
        faraday.request  :json
        faraday.response :json, content_type: /\bjson$/
        # faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

    def post(url, payload)
      @conn.post(url, payload).body
    end

    def get(url)
      @conn.get(url).body
    end
  end

  class Upload
    def initialize(config = Cloudconvert.configuration)
      @up ||= Faraday.new(url: config.api_url) do |faraday|
        faraday.request  :multipart
        faraday.request  :url_encoded
        faraday.response :json, content_type: /\bjson$/
        # faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

    def post(url, payload)
      @up.post(url, payload).body
    end
  end
end
