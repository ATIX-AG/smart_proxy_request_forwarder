# frozen_string_literal: true

require 'smart_proxy_request_forwarder/api'

map '/request_forwarder' do
  run Proxy::RequestForwarder::Api
end
