# frozen_string_literal: true

module Proxy::RequestForwarder
  class Plugin < ::Proxy::Plugin
    rackup_path File.expand_path('http_config.ru', __dir__)

    default_settings enabled: true
    plugin :request_forwarder, ::Proxy::VERSION
  end
end
