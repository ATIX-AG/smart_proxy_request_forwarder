# frozen_string_literal: true

require 'proxy/request'

module Proxy::RequestForwarder
  class ProxyRequest < ::Proxy::HttpRequest::ForemanRequest
    include Proxy::Log
    def foreman_request(request)
      path = "api#{request.path.delete_prefix('/request_forwarder')}"
      req = request_factory.create_post(path, request.body.read)
      send_request(req)
    end
  end
end
